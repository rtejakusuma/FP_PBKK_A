package com.mangujang.piknikYuk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mangujang.piknikYuk.model.Tour;
import com.mangujang.piknikYuk.service.TourService;

@Controller
@RequestMapping("/tour")
public class TourController {
	
	// inject tourService
	@Autowired
	private TourService tourService;
	
	@GetMapping("/list")
	public String listTour(Model theModel) {
		
		// inject tourService
		List<Tour> theTours = tourService.getTours();
		
		// add tour to theModel
		theModel.addAttribute("tours", theTours);
		
		// load jsp page
		return "tour/list-tour";
	}

}
