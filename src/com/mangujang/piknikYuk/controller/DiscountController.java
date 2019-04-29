package com.mangujang.piknikYuk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mangujang.piknikYuk.model.Discounts;
import com.mangujang.piknikYuk.service.DiscountService;

@Controller
@RequestMapping("/discount")
public class DiscountController {
	
	//inject discountservice
	@Autowired
	public DiscountService discountService;
	
	@GetMapping("/list")
	public String listDiscount(Model theModel) {
		
		// inject discountService
		List<Discounts> theDiscounts = discountService.getDiscounts();
		
		//add tour to theModel
		theModel.addAttribute("discounts", theDiscounts);
		
		//load the page
		return "user/list-discount";
	}
}
