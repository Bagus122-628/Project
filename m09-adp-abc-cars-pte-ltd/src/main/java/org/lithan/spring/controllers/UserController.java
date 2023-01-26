package org.lithan.spring.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lithan.spring.models.Role;
import org.lithan.spring.models.User;
import org.lithan.spring.repository.CarRepository;
import org.lithan.spring.repository.RoleRepository;
import org.lithan.spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController extends WebControllerBuilder {

   @GetMapping("login")
   public ModelAndView loginView() {
      System.out.println("in-login-view");
      return new ModelAndView("login-page");
   }

   @GetMapping("logout")
   public ModelAndView logoutView(HttpServletRequest request, HttpServletResponse response) {
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      if (auth != null) {
         new SecurityContextLogoutHandler().logout(request, response, auth);
      }

      return new ModelAndView("redirect:/login?logout");
   }

   @GetMapping("registration")
   public ModelAndView registrationView() {
      System.out.println("in-registration-view");
      return new ModelAndView("register-page", "user", new User());
   }

   @PostMapping("regist")
   public ModelAndView register(@ModelAttribute User user) {
      System.out.println("in-regiser: " + user.toString());
      List<Role> roleUser = new ArrayList<>();
      // this add ROLE_User to registerd user
      roleUser.add(this.roleRepository.findById(2L).get());

      user.setRoles(roleUser);
      user.setPassword(this.passwordEncoder.encode(user.getPassword()));

      this.userRepository.save(user);
      return new ModelAndView("login-page", "message", "thanks for your registration, enjoy!:)");
   }

   @GetMapping("profile")
   @PreAuthorize("hasAnyRole('USER','ADMIN')")
   public ModelAndView profileView(@RequestParam(name = "message", required = false) String message) {
      String username = SecurityContextHolder.getContext().getAuthentication().getName();
      User currentUser = this.userRepository.findByUsername(username).get();

      String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
      System.out.println("role:" + role);
      System.out.println("in-profile-view");

      ModelAndView mav = new ModelAndView("profile-page", "user", currentUser);
      mav.addObject("lists", this.carRepository.findByPublisher(currentUser));
      mav.addObject("message", message);
      return mav;

   }

   @GetMapping("update/{id}")
   @PreAuthorize("hasAnyRole('ADMIN','USER')")
   public ModelAndView updateView(@PathVariable long id) {
      System.out.println("in-update-view");
      return new ModelAndView("update-page", "user", this.userRepository.findById(id).get());
   }

   @PostMapping("update")
   public ModelAndView update(@ModelAttribute User user) {
      System.out.println("in-update: ");
      User currentUser = this.userRepository.findById(user.getId()).get();
      currentUser.setPhoneNumber(user.getPhoneNumber());
      this.userRepository.save(currentUser);

      String role = SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString();
      if (role.equalsIgnoreCase("[ROLE_ADMIN]")) {
         System.out.println("isAdmin");

         return new ModelAndView("redirect:/manage-users", "message", " profile is updated");
      }

      return new ModelAndView("redirect:/profile", "message", "your profile is updated");
   }

}
