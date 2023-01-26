package org.spring.controller;

import org.spring.service.EmailService;
import org.spring.service.WebAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@Autowired
	WebAppService service;

	@Autowired
	EmailService sender;

	@GetMapping("/admin")
	public String admin(Model model) {
		model.addAttribute("list", service.listAllUser());

		return "admin";
	}
}
