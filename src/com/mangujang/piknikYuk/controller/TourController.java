package com.mangujang.piknikYuk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

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
		
		//inject openingSercive
		List<OpeningHour> theOpening = openingService.getOpening(tourId);
		System.out.println(openingService.getOpening(tourId));
		
		//add tour to the model
		theModel.addAttribute("opening", theOpening);
		
		//load page
		return "tour/list-open";
		
	}
	
	@GetMapping("/open-addForm")
	public String showOpenForm(
			Model theModel,
			@RequestParam("id") int tourId
			) {
		Map<String, String> days = new LinkedHashMap<String, String>();
		days.put("1", "Senin");
		days.put("2", "Selasa");
		days.put("3", "Rabu");
		days.put("4", "Kamis");
		days.put("5", "Jumat");
		days.put("6", "Sabtu");
		days.put("7", "Minggu");
		theModel.addAttribute("days", days);
		
		OpeningHour theOpening = new OpeningHour();
		theModel.addAttribute("opening", theOpening);
		
		return "tour/form-open";
	}
	
	@PostMapping("/open-save")
	public String saveOpening(
			@RequestParam("id") int id,
			@RequestParam("day") int day,
			@RequestParam("openTime") String openTime,
			@RequestParam("closeTime") String closeTime,
			@RequestParam("tourLocation") int tourId
			) throws ParseException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		openTime  = openTime.concat(":00");
		closeTime = closeTime.concat(":00");
		
		Date open = sdf.parse(openTime);
		Date close = sdf.parse(closeTime);
		
		OpeningHour opening = new OpeningHour();
		
		opening.setDay(day);
		opening.setOpenTime(open);
		opening.setCloseTime(close);
		
		openingService.saveOpening(opening, tourId);
		
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

