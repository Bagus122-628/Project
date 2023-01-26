package org.spring.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.spring.model.Message;
import org.spring.model.Threads;
import org.spring.model.User;
import org.spring.service.EmailService;
import org.spring.service.TokenGeneratorService;
import org.spring.service.WebAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebAppController {
	@Autowired
	WebAppService service;

	@Autowired
	EmailService sender;

	@GetMapping("/home")
	public String home(@ModelAttribute("user") User user, HttpSession model) {

		model.setAttribute("thread", service.listAllTread());

		return service.isOnline() ? "home-page" : "login";

	}

	@GetMapping("/profile/{id}")
	public String profiel(@PathVariable("id") long id, Model model) {
		if (!service.isOnline())
			return "login";

		model.addAttribute("user", service.get(id));
		if (service.getCurrentUser().getId() == id)
			model.addAttribute("canEdit", true);
		
		return "profile";
	}

	@GetMapping("/search")
	public String search(@PathParam("keyword") String keyword, Model model) {
		if (keyword == null) {
			model.addAttribute("userList", service.listAllUser());
			return "search";
		}

		model.addAttribute("userList", service.search(keyword));
		return "search";
	}

	@GetMapping("/thankyou")
	public String thankyou() {
		return "registration-thankyou";
	}

	@GetMapping("/password-reset")
	public String password() {
		return "password-reset";
	}

	@GetMapping("/password-change")
	public String passwordChange(@RequestParam("token") String token, HttpSession sesison) {
		sesison.setAttribute("token", token);
		return "password-change";
	}

	@PostMapping("password-change")
	public String passwordChangeCheck(@RequestParam("password") String password, HttpSession session) {
		String token = session.getAttribute("token").toString();
		User user = service.findByToken(token);
		user.setPassword(password);
		user.setToken(null);
		service.save(user);

		return "redirect:/login";
	}

	@GetMapping("/password-reset-check")
	public String passwordReset(@PathParam("email") String email, HttpServletRequest req)
			throws UnsupportedEncodingException, MessagingException {
		String token = new TokenGeneratorService().getToken(8);
		String link = "http://localhost:8080" + req.getContextPath() + "/password-change?token=" + token;
		//sender.sendPasswordReset(email, link);
		User user = service.findByEmail(email);
		user.setToken(token);
		service.save(user);
		return "redirect:/login";
	}
	
	@GetMapping("addThread")
	public String addThread(Model model) {		
		Threads thread = new Threads();
		thread.setContent("hero.jpg");
		
		model.addAttribute("thread", thread);
		return "add-thread";
	}
	
	@PostMapping("addThread")
	public ModelAndView uploadThread(@ModelAttribute("thread") Threads thread) {
		ModelAndView mav = new ModelAndView();
		thread.setPublisher(service.getCurrentUser());
		thread.setPublishDate( new Date());
		System.out.println(thread);
		service.save(thread);
		mav.setViewName("redirect:/home");
		
		return mav;
	}
	
	@GetMapping("message")
	public String getMessage(@PathParam("id") Long id, Model model) {
		List<User> list = service.listAllUser();
//		List<Message> message1 = service.listAllMessage(2);
//		System.out.println("1message :" + message1);
		
		if(id != null) {
			List<Message> message = service.listAllMessage(id);
			System.out.println("form id:" + id);
			System.out.println("message :" + message);
			model.addAttribute("fromId", id);
			model.addAttribute("msg", message);
		}
		
		model.addAttribute("list", list);
		System.out.println("list :" + list.toString());
		model.addAttribute("newMessage", new Message());
		return "message";
	}
	
	@PostMapping("sendMessage")
	public String sendMessage(
			@ModelAttribute("message") Message message) {
		
		message.setFromUser(service.getCurrentUser());
		message.setToUser(service.get(message.getToUser().getId()));
		message.setSendOn(new Date());
		System.out.println("msg :" + message);
		service.save(message);
		return "redirect:/message";
	}

}
