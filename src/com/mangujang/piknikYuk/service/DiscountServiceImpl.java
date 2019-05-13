package com.mangujang.piknikYuk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mangujang.piknikYuk.dao.DiscountDAO;
import com.mangujang.piknikYuk.model.Discount;

@Service
public class DiscountServiceImpl implements DiscountService {

	//inject DiscountDAO
	@Autowired
	private DiscountDAO discountDAO;
	
	@Override
	@Transactional
	public List<Discount> getDiscounts() {
		return discountDAO.getDiscounts();
	}

	@Override
	@Transactional
	public void saveDiscount(Discount theDiscount) {
		discountDAO.saveDiscount(theDiscount);
		
	}

	@Override
	@Transactional
	public Discount getDiscount(int theId) {
		// TODO Auto-generated method stub
		return discountDAO.getDiscount(theId);
	}

	@Override
	@Transactional
	public void deleteDiscount(int theId) {
		// TODO Auto-generated method stub
		discountDAO.deleteDiscount(theId);
	}
	

}
