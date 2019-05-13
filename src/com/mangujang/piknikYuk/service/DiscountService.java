package com.mangujang.piknikYuk.service;

import java.util.List;
import com.mangujang.piknikYuk.model.Discounts;

public interface DiscountService {
	public List<Discounts> getDiscounts();
	
	public void saveDiscount(Discounts theDiscount);

	public Discounts getDiscount(int theId);
}
