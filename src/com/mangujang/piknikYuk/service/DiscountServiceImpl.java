package com.mangujang.piknikYuk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mangujang.piknikYuk.dao.DiscountDAO;
import com.mangujang.piknikYuk.model.Discounts;

@Service
public class DiscountServiceImpl implements DiscountService {

	//inject DiscountDAO
	@Autowired
	private DiscountDAO discountDAO;
	
	@Override
	@Transactional
	public List<Discounts> getDiscounts() {
		return discountDAO.getDiscounts();
	}

	@Override
	@Transactional
	public void saveDiscount(Discounts theDiscount) {
		discountDAO.saveDiscount(theDiscount);
		
	}

	@Override
	@Transactional
	public Discounts getDiscount(int theId) {
		// TODO Auto-generated method stub
		return discountDAO.getDiscounts(theId);
	}
	

}
