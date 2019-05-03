package com.mangujang.piknikYuk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mangujang.piknikYuk.model.Discounts;
import com.mangujang.piknikYuk.service.DiscountService;

@Controller
@RequestMapping("/discount")
public class DiscountController {
	
	//inject discountservice
	@Autowired
	public DiscountService discountService;
	
	// bind date format
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	    sdf.setLenient(true);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}
	
	@GetMapping("/list")
	public String listDiscount(Model theModel) {
		
		// inject discountService
		List<Discounts> theDiscounts = discountService.getDiscounts();
		
		//add tour to theModel
		theModel.addAttribute("discounts", theDiscounts);
		
		//load the page
		return "discount/list-discount";
	}
	
	@GetMapping("/addDiscountForm")
	public String showDiscountForm(Model theModel) {
		
		// create model to bind form data
		Discounts theDiscount = new Discounts();
		
		theModel.addAttribute("discount", theDiscount); // <-- name-value pair
		
		return "discount/form-discount";
	}
	
//	@PostMapping("/saveDiscount")
//	public String saveDiscount(
//			@ModelAttribute("discount") Discounts theDiscount,
//			@ModelAttribute("date") Date date
//			) {
//		return "redirect:/discount/list";
//	}
	
	@PostMapping("/saveDiscount")
	public String saveDiscount(
			@RequestParam("description") String description,
			@RequestParam("discountValue") Double discountValue,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime
			) throws ParseException {				
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date startDate = sdf.parse(startTime);
	    Date endDate = sdf.parse(endTime);
	    
	    // date parameter handling
 		Discounts theDiscount = new Discounts();
 		
 		theDiscount.setDescription(description);
 		theDiscount.setDiscountValue(discountValue);
 		theDiscount.setStartTime(startDate);
 		theDiscount.setEndTime(endDate);
 		
 		// save discount using service
 		discountService.saveDiscount(theDiscount);
	    
		return "redirect:/discount/list";
	}
}
