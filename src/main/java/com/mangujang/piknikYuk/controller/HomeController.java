package com.mangujang.piknikYuk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/login")
	public String loginPage() {
		String page = "user/login-user";
		return page;
	}
	
	@RequestMapping("/register")
	public String regisPage() {
		String page = "user/register-user";
		return page;
	}
}
