package com.mangujang.piknikYuk.controller;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		// create model attribute to bind form data
		User theUser = new User();
		theModel.addAttribute("user", theUser);
		return "user/register-user";
	}
	
	@GetMapping("/updateUserForm")
	public String updateUser(
			@RequestParam("userId") int theId, 
			Model theModel
			) {		
		// get user data from db
		User theUser = userService.getUser(theId);
		
		// set user data to model object
		theModel.addAttribute("user", theUser);
		
		// send to form page		
		return "user/update-user";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User theUser) {
		
		// password hashing
		MessageDigest digest;
		try {
			// Static getInstance method is called with hashing SHA 
			digest = MessageDigest.getInstance("SHA-256");
			
			// digest() method called 
            // to calculate message digest of an input 
            // and return array of byte 
			byte[] hash = digest.digest(theUser.getPassword().getBytes(StandardCharsets.UTF_8));

			// Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, hash); 
  
            // Convert message digest into hex value 
            String hashtext = no.toString(16); 
  
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
            
            theUser.setPassword(hashtext);
            
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//save the customer using our service
		
		userService.saveUser(theUser);
		return "redirect:/user/list";
	}
	
	@GetMapping("/delete")
	public String deleteUser(
			@RequestParam("userId") int theId,
			RedirectAttributes theModel
			) {
		// delete user
		userService.deleteUser(theId);
		
		// flag?
		// set user data to model object
		theModel.addFlashAttribute("delete_flag", 1);
		
		return "redirect:/user/list";
	}
}
