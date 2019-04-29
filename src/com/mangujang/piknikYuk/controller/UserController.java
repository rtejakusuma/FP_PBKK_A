package com.mangujang.piknikYuk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mangujang.piknikYuk.model.User;
import com.mangujang.piknikYuk.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// need to inject userService
	@Autowired
	private UserService userService;
	
	@GetMapping("/list")
	public String listUser(Model theModel) {
		
		// get user from the dao
		List<User> theUsers = userService.getUsers();
		
		// add users to theModel
		theModel.addAttribute("users", theUsers);
		
		// load jsp page
		return "user/list-user";
		
	}
	
	@GetMapping("/addUserForm")
	public String addUser(Model theModel) {
		
		//create model attribute to bind form data
		User theUser = new User();
		theModel.addAttribute("user", theUser);
		return "user/user-form";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User theUser) {
		//save the customer using our service
		userService.saveUser(theUser);
		return "redirect:/user/list";
	}
}
