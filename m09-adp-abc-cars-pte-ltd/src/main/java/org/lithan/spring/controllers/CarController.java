package org.lithan.spring.controllers;

import java.lang.ProcessBuilder.Redirect;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.Date;

import org.lithan.spring.models.Bidding;
import org.lithan.spring.models.Car;
import org.lithan.spring.models.User;
import org.lithan.spring.repository.BiddingRepository;
import org.lithan.spring.repository.CarRepository;
import org.lithan.spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@PreAuthorize("hasAnyRole('ADMIN','USER')")
public class CarController extends WebControllerBuilder {

   @GetMapping("post")
   public ModelAndView postView() {
      System.out.println("in-post-view");
      return new ModelAndView("post-page", "car", new Car());
   }

   @PostMapping("post-car")
   public ModelAndView post(@ModelAttribute Car car, @RequestParam("file") MultipartFile image) {
      System.out.println("in-post" + car);

      String message = "";

      try {
         this.filesStorageService.save(image);

         message = "Uploaded the image successfully: " + image.getOriginalFilename();
      } catch (Exception e) {
         message = "Could not upload the image: " + image.getOriginalFilename() + ". Error: " + e.getMessage();
      }
      System.out.println(message);
      String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
      car.setPhoto(image.getOriginalFilename());
      car.setActive(true);
      car.setPublisher(userRepository.findByUsername(currentUser).get());
      car.setPublishOn(new Date());
      carRepository.save(car);
      return new ModelAndView("redirect:/post", "message", "your car was added");
   }

   @GetMapping("update-post/{id}")
   public ModelAndView updateView(@PathVariable long id) {
      System.out.println("in-update-post" + id);
      return new ModelAndView("post-update-page", "car", carRepository.findById(id).get());
   }

   @PostMapping("update-car")
   public ModelAndView updateCar(@ModelAttribute Car car) {
      System.out.println("in-update-car: ");
      Car currentCar = carRepository.findById(car.getId()).get();
      currentCar.setMake(car.getMake());
      currentCar.setModel(car.getModel());
      currentCar.setYear(car.getYear());
      currentCar.setPrice(car.getPrice());
      currentCar.setDescription(car.getDescription());
      carRepository.save(currentCar);

      String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
      if (role.equalsIgnoreCase("[ROLE_ADMIN]")) {
         System.out.println("isAdmin");

         return new ModelAndView("redirect:/manage-cars", "message", " car was updated");
      }
      return new ModelAndView("redirect:/profile", "message", "your post is updated");
   }

   @GetMapping("post-detaile/{id}")
   public ModelAndView postDetail(@PathVariable long id) {
      Car car = carRepository.findById(id).get();
      ModelAndView mav = new ModelAndView("post-detaile-page", "car", car);
      mav.addObject("lists", biddingRepository.findByCar(car));
      mav.addObject("bidding", new Bidding());
      return mav;
   }

   @PostMapping("bidding/{id}")
   public ModelAndView bidding(@PathVariable long id, @ModelAttribute Bidding bidding) {

      String username = SecurityContextHolder.getContext().getAuthentication().getName();
      User currentUser = userRepository.findByUsername(username).get();
      Car currentCar = carRepository.findById(id).get();

      bidding.setUser(currentUser);
      bidding.setCar(currentCar);
      bidding.setTimestamp(Timestamp.from(Instant.now()));

      biddingRepository.save(bidding);

      return new ModelAndView("redirect:/post-detaile/" + id);
   }

   @GetMapping("car-toggle-status/{id}")
   public ModelAndView carToggelStatus(@PathVariable long id) {
      Car car = carRepository.findById(id).get();
      if (car.isActive()) {
         car.setActive(false);
      } else {
         car.setActive(true);
      }

      carRepository.save(car);
      String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
      if (role.equalsIgnoreCase("[ROLE_ADMIN]")) {
         System.out.println("isAdmin");

         return new ModelAndView("redirect:/manage-cars", "message", " status change success");
      }

      return new ModelAndView("redirect:/profile");

   }

}
