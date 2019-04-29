package com.mangujang.piknikYuk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tour")
public class TourController {
	
	@GetMapping("/list")
	public String listTour(Model theModel) {
		
		// inject tourService
		
		// add tour to theModel
		
		// load jsp page
		
		
		return null;
	}

}
