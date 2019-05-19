package com.mangujang.piknikYuk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mangujang.piknikYuk.model.User;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String homePageRedirect() {
		String page = "redirect:home";
		
		return page;
	}
	
	@RequestMapping("/home")
	public String homePage() {
		String page = "home";
		
		return page;
	}
	
	@GetMapping("/login")
	public String showLogin(String error, Model model) {
		
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("error", error);
		
		String page = "user/login-user";
		return page;
	}
	
	@RequestMapping("/register")
	public String regisPage() {
		String page = "user/register-user";
		return page;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession httpSession, Model model) {
		if(httpSession.getAttribute("user") != null) {
			httpSession.setAttribute("user", null);
		}
		
		return "redirect:home";
	}
}
