package com.mangujang.piknikYuk.service;

import java.util.List;
import com.mangujang.piknikYuk.model.Discount;

public interface DiscountService {
	public List<Discount> getDiscounts();
	
	public void saveDiscount(Discount theDiscount);

	public Discount getDiscount(int theId);

	public void deleteDiscount(int theId);
}
