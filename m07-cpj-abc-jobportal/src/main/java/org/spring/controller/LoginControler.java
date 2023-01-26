package org.spring.controller;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.spring.model.User;
import org.spring.service.EmailService;
import org.spring.service.WebAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginControler {

	@Autowired
	WebAppService service;

	@Autowired
	EmailService sender;

	@GetMapping({ "/", "/login" })
	public String login(Model model) {
		model.addAttribute("user", new User());

		return "login";
	}
	
	@Transactional
	@PostMapping("/check")
	public ModelAndView checkuser(@ModelAttribute("user") User user, HttpSession session) {
		User usr = service.findByEmail(user.getEmail());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		if (usr == null) {
			mav.addObject("msg", "no current user found with thst email");
			return mav;
		}

		if (!usr.getPassword().equals(user.getPassword())) {
			mav.addObject("psw", "wrong password");
			return mav;
		}
		System.out.println("current: "+usr);
		service.setCurrentUser(usr);

		session.setAttribute("list", service.listAllUser());
		session.setAttribute("currentUser", service.getCurrentUser());

		if (service.isAdmin()) {
			session.setAttribute("online", service.getUserEmail());
			session.setAttribute("isOnline", service.isOnline());
			session.setAttribute("isAdmin", service.isAdmin());
			mav.setViewName("redirect:/admin");
			return mav;
		}
		
		session.setAttribute("online", service.getUserEmail());
		session.setAttribute("isOnline", service.isOnline());
		mav.setViewName("redirect:/home");

		return mav;

	}

	@GetMapping("logout")
	public String logout(HttpSession session) {
		service.setCurrentUser(null);
		session.invalidate();

		return "redirect:/login";
	}
}
