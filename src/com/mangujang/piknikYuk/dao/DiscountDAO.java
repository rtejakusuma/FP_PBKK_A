package com.mangujang.piknikYuk.dao;

import java.util.List;

import com.mangujang.piknikYuk.model.Discounts;

public interface DiscountDAO {
	public List<Discounts> getDiscounts();

	public void saveDiscount(Discounts theDiscount);

	public Discounts getDiscounts(int theId);
}
