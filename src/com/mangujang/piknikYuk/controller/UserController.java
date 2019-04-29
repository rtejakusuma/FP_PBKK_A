package com.mangujang.piknikYuk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mangujang.piknikYuk.dao.UserDAO;
import com.mangujang.piknikYuk.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping("/list")
	public String listUser(Model theModel) {
		
		// get user from the dao
		List<User> theUsers = userDAO.getUsers();
		
		// add users to theModel
		theModel.addAttribute("users", theUsers);
		
		return "user/list-users";
		
	}
}
