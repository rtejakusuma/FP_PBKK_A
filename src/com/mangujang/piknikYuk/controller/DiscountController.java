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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mangujang.piknikYuk.model.Discount;
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
		List<Discount> theDiscounts = discountService.getDiscounts();
		
		//add tour to theModel
		theModel.addAttribute("discounts", theDiscounts);
		
		//load the page
		return "discount/list-discount";
	}
	
	@GetMapping("/addDiscountForm")
	public String showDiscountForm(Model theModel) {
		
		// create model to bind form data
		Discount theDiscount = new Discount();
		
		theModel.addAttribute("discount", theDiscount); // <-- name-value pair
		
		return "discount/form-discount";
	}
	
	@PostMapping("/saveDiscount")
	public String saveDiscount(
			@RequestParam("id") int id,
			@RequestParam("description") String description,
			@RequestParam("code") String code,
			@RequestParam("discountValue") Double discountValue,
			@RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime
			) throws ParseException {				
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date startDate = sdf.parse(startTime);
	    Date endDate = sdf.parse(endTime);
	    
	    // date parameter handling
 		Discount theDiscount = new Discount();
 		
 		theDiscount.setId(id);
 		theDiscount.setDescription(description);
 		theDiscount.setCode(code);
 		theDiscount.setDiscountValue(discountValue);
 		theDiscount.setStartTime(startDate);
 		theDiscount.setEndTime(endDate);
 		
 		// save discount using service
 		discountService.saveDiscount(theDiscount);
	    
		return "redirect:/discount/list";
	}
	
	@GetMapping("/updateDiscountForm")
	public String updateDiscountForm(
			@RequestParam("discountId") int theId, Model theModel) {
		
		// get customer from database
		Discount theDiscount = discountService.getDiscount(theId);
		
		// set customer as model attribute to pre-populate the form
		theModel.addAttribute("discount", theDiscount);
		
		// send over to our form
		
		return "discount/update-discount";
	}
	
	@GetMapping("/delete")
	public String deleteDiscount(
			@RequestParam ("discountId") int theId,
			RedirectAttributes theModel
			) {
		
		//delete the discount
		discountService.deleteDiscount(theId);
		
		// flag?
		// set user data to model object
		theModel.addFlashAttribute("delete_flag", 1);
		
		return "redirect:/discount/list";
	}
	
}
