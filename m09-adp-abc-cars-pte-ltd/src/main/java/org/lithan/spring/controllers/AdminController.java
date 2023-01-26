package org.lithan.spring.controllers;

import java.util.ArrayList;
import java.util.List;

import org.lithan.spring.models.Bidding;
import org.lithan.spring.models.Role;
import org.lithan.spring.models.User;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@PreAuthorize("hasRole('ADMIN')")
public class AdminController extends WebControllerBuilder {

   @GetMapping("manage-users")
   public ModelAndView usersView(@RequestParam(name = "message", required = false) String message) {

      // List<Role> list = new ArrayList<>();
      // list.add(roleRepository.findById(2L).get());
      // User nanda = userRepository.findById(3L).get();
      // nanda.setRoles(list);
      // userRepository.save(nanda);
      ModelAndView mav = new ModelAndView("dashboard-users-page", "listUser", this.userRepository.findAll());
      mav.addObject("message", message);
      return mav;
   }

   @GetMapping("manage-cars")
   public ModelAndView carsView(@RequestParam(name = "message", required = false) String message, Model model) {
      model.addAttribute("message", message);
      return new ModelAndView("dashboard-cars-page", "listCar", this.carRepository.findAll());
   }

   @GetMapping("manage-biddings")
   public ModelAndView biddingsView(@RequestParam(name = "message", required = false) String message, Model model) {
      model.addAttribute("message", message);
      return new ModelAndView("dashboard-biddings-page", "listBidding", this.biddingRepository.findAll());
   }

   @GetMapping("toggle-authority/{id}")
   public ModelAndView toggleAuthoroy(@PathVariable long id) {
      Role roleAdmin = this.roleRepository.findById(1L).get();
      Role roleUser = this.roleRepository.findById(2L).get();
      List<Role> roles = new ArrayList<>();

      User user = this.userRepository.findById(id).get();
      if (user.getRoles().get(0).equals(roleUser)) {
         roles.add(roleAdmin);
         System.out.println("isUser");
      } else {
         roles.add(roleUser);
         System.out.println("isAdmin");
      }
      user.setRoles(roles);
      this.userRepository.save(user);
      return new ModelAndView("redirect:/manage-users", "message", "success, toggle user auhotiry");
   }

   @GetMapping("toggle-bidding-status/{id}")
   public ModelAndView toggleBiddingStatus(@PathVariable long id) {

      Bidding bidding = this.biddingRepository.findById(id).get();
      bidding.setStatus(!bidding.isStatus());

      this.biddingRepository.save(bidding);
      return new ModelAndView("redirect:/manage-biddings", "message", "success, toggle bidding status");
   }

}