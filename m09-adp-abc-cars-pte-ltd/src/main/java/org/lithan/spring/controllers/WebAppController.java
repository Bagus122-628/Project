package org.lithan.spring.controllers;

import java.time.Year;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.mapping.Any;
import org.lithan.spring.models.Car;
import org.lithan.spring.repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebAppController extends WebControllerBuilder {

   @GetMapping("home")
   public ModelAndView homeView() {
      System.out.println("in-home-view");
      return new ModelAndView("home-page");
   }

   @GetMapping("search")
   public ModelAndView searchView(
         @RequestParam(required = false, defaultValue = "") String keyword,
         @RequestParam(required = false, defaultValue = "1") Double min,
         @RequestParam(required = false, defaultValue = "1000") Double max) {
      ModelAndView mav = new ModelAndView("search-page");

      if (!keyword.isEmpty()) {
         List<Car> res = this.carRepository.search(keyword, min, max);
         System.out.println("res:" + res.isEmpty());
         if (res.isEmpty())
            mav.addObject("message", " sorry no car was found");
         mav.addObject("lists", res);
      } else {

         mav.addObject("lists", this.carRepository.findAll());
      }
      return mav;
   }

   @GetMapping("about")
   public ModelAndView aboutView() {
      System.out.println("in-about-view");
      return new ModelAndView("about-page");
   }

   @GetMapping("contact")
   public ModelAndView contactView() {
      System.out.println("in-contact-view");
      return new ModelAndView("contact-page");
   }

   @GetMapping("terms")
   public ModelAndView termsView() {
      System.out.println("in-terms-view");
      return new ModelAndView("terms-page");
   }

   @GetMapping("/403")
   public ModelAndView error403() {
      return new ModelAndView("error/403");

   }
}
