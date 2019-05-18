package com.mangujang.piknikYuk.controller;

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

import com.mangujang.piknikYuk.model.OpeningHour;
import com.mangujang.piknikYuk.model.Tour;
import com.mangujang.piknikYuk.model.User;
import com.mangujang.piknikYuk.service.OpeningService;
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
	
	@GetMapping("/addTourForm")
	public String showTourForm(Model theModel) {
		
		//create model to bind form data
		Tour theTour = new Tour();
		OpeningHour openingHour = new OpeningHour();
		theModel.addAttribute("tour", theTour);
		
		return "tour/form-tour";
	}
	
	@PostMapping("/saveTour")
	public String saveTour(@ModelAttribute("tour") Tour theTour) {
		
		tourService.saveTour(theTour);
		return "redirect:/tour/list";
	}
	
	@GetMapping("/updateTourForm")
	public String updateTourForm(
			@RequestParam("tourId") int theId, Model theModel) {
		//get tour data from db
		Tour theTour = tourService.getTour(theId);
		
		//set tour data to the model
		theModel.addAttribute("tour", theTour);
		
		//send to form page
		return "tour/update-tour";
	}
	
	@GetMapping("delete")
	public String deleteTour(
			@RequestParam("tourId") int theId, RedirectAttributes theModel) {
		
		//delete user
		tourService.deleteTour(theId);
		
		//flag?
		//set tour data to model object
		theModel.addFlashAttribute("delete_flag", 1);
		
		return "redirect:/tour/list";
	}
	
	//inject openingservice
	@Autowired
	public OpeningService openingService;
		
	@GetMapping("/open-list")
	public String openList(
			@RequestParam("id") int tourId,
			Model theModel) {
		
		//inject openingSercive
		List<OpeningHour> theOpening = openingService.getOpening();
		
		//add tour to the model
		theModel.addAttribute("opening", theOpening);
		
		//load page
		return "tour/list-opening-tour";
		
	}
}

