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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController {

	@Autowired
	WebAppService service;

	@Autowired
	EmailService sender;

	@GetMapping("/userform")
	public String showForm(Model model) {
		model.addAttribute("user", new User());

		return "registration";
	}

	@PostMapping("/add")
	public String addUser(@ModelAttribute("user") User user) {
		System.out.println("current :" + user.toString());

		user.setRole("user");
		service.save(user);

		// emailService.sendMail("gusnanda0703@gmail.com", "thankyou", "thankyou for
		// your registraiton");
		if (service.isAdmin())
			return "redirect:/admin";

		return "redirect:/thankyou";
	}

	@Transactional
	@GetMapping("edituserform/{id}")
	public String showEditForm(@PathVariable("id") Long id, Model model, HttpSession session) {

		User user = service.get(id);
		System.out.println("before : " + user);
		session.setAttribute("id", user.getId());
		model.addAttribute("user", user);

		return "profile-update";
	}

	@PostMapping("edituserform/update")
	public String updateUser(@ModelAttribute("user") User user, HttpSession session) {

		System.out.println("current:" + user);
		service.save(user);

		if (service.isAdmin())
			return "redirect:/admin";

		return "redirect:/home";
	}

	@Transactional
	@GetMapping("deleteuser/{id}")
	public String deleteUser(@PathVariable("id") Long id, Model model) {
		service.deleteUser(id);

		return "redirect:/admin";
	}
}
