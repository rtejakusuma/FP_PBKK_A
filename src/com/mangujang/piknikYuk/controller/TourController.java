package com.mangujang.piknikYuk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mangujang.piknikYuk.model.OpeningForm;
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
	public String listTour(User user, Model theModel, HttpSession httpSession) {
		User username = (User) httpSession.getAttribute("user");
		if(username == null) {
			theModel.addAttribute("error", "login terlebih dahulu");
			return "redirect:../login";
		}
		// inject tourService
		List<Tour> theTours = tourService.getTours();
		
		// add tour to theModel
		theModel.addAttribute("tours", theTours);
		theModel.addAttribute("role", username.getRole());
		
		// load jsp page
		return "tour/list-tour";
	}
	
	@GetMapping("/addTourForm")
	public String showTourForm(Model theModel) {
		
		//create model to bind form data
		Tour theTour = new Tour();
		
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
	
	@GetMapping("/delete")
	public String deleteTour(
			@RequestParam("tourId") int theId, RedirectAttributes theModel) {
		
		//delete user
		tourService.deleteTour(theId);
		
		//flag?
		//set tour data to model object
		theModel.addFlashAttribute("delete_flag", 1);
		
		return "redirect:/tour/list";
	}
	
	//OPENING SERRVICE
	//inject openingservice
	@Autowired
	public OpeningService openingService;
		
	@GetMapping("/open-list")
	public String openList(
			@RequestParam("id") int tourId,
			Model theModel) {
		
		List<String> days = new ArrayList<>();
		days.add("Senin");
		days.add("Selasa");
		days.add("Rabu");
		days.add("Kamis");
		days.add("Jumat");
		days.add("Sabtu");
		days.add("Minggu");
		theModel.addAttribute("days", days);
		
		//get tour data from db
		Tour theTour = tourService.getTour(tourId);
		
		//set tour data to the model
		theModel.addAttribute("tour", theTour);
		
		//inject openingSercive
		List<OpeningHour> theOpening = openingService.getOpening(tourId);
		System.out.println(theTour);
		
		//add tour to the model
		theModel.addAttribute("opening", theOpening);
		
		//load page
		return "tour/list-open";
		
	}
	// global
	int flag;
	
	@GetMapping("/open-addForm")
	public String showOpenForm(
			Model theModel,
			@RequestParam("id") int tourId
			) {

		List<OpeningHour> theOpening = new ArrayList<OpeningHour>();
		
		theOpening = openingService.getOpening(tourId);
		System.out.print(theOpening);
		if(theOpening.isEmpty()) {
			String start = "00:00";
			String end = "23:59";
			
			OpeningHour op = openingService.getIndex();
			System.out.println(op);
			if(op == null) {
				flag = 0;
				System.out.println("cek2");
				theOpening.add(new OpeningHour(1, 1, start, end));
				theOpening.add(new OpeningHour(2, 2, start, end));
				theOpening.add(new OpeningHour(3, 3, start, end));
				theOpening.add(new OpeningHour(4, 4, start, end));
				theOpening.add(new OpeningHour(5, 5, start, end));
				theOpening.add(new OpeningHour(6, 6, start, end));
				theOpening.add(new OpeningHour(7, 7, start, end));	
			} else {
				System.out.println("cek");
				flag = 0;
				theOpening.add(new OpeningHour(op.getId()+1, 1, start, end));
				theOpening.add(new OpeningHour(op.getId()+2, 2, start, end));
				theOpening.add(new OpeningHour(op.getId()+3, 3, start, end));
				theOpening.add(new OpeningHour(op.getId()+4, 4, start, end));
				theOpening.add(new OpeningHour(op.getId()+5, 5, start, end));
				theOpening.add(new OpeningHour(op.getId()+6, 6, start, end));
				theOpening.add(new OpeningHour(op.getId()+7, 7, start, end));	
			}
			System.out.println("Asu");			
		} else {
			flag = 1;
		}
		
		OpeningForm form = new OpeningForm();
		form.setOpenings(theOpening);
		theModel.addAttribute("form", form);
		theModel.addAttribute("tourId", tourId);
		
		return "tour/form-open";
	}
	
	@PostMapping("/open-save")
	public String saveOpening(
			@ModelAttribute("form") OpeningForm form,
			@RequestParam("id") int tourId
			) {
//		System.out.println(form);
//		System.out.println(form.getOpenings());
		List<OpeningHour> theOpening = new ArrayList<OpeningHour>();
		theOpening = form.getOpenings();
		System.out.println(">> "+flag);
		for(int i=0; i<7; i++) {
			openingService.saveOpening(theOpening.get(i), tourId, flag);
		}
		
		return "redirect:/tour/open-list?id="+tourId;
	}
	
	@GetMapping("/open-delete")
	public String deleteOpening(
			@RequestParam("openingId") int id, RedirectAttributes theModel) {
		
		//delete user
		openingService.deleteOpening(id);
		
		//flag?
		//set tour data to model object
		theModel.addFlashAttribute("delete_flag", 1);
		
		return "redirect:/tour/list-opening-tour";
	}
	
}

