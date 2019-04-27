package com.mangujang.piknikYuk.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/list")
	public String listUser(Model theModel) {
		
		return "list-users";
		
	}
}
