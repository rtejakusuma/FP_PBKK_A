package com.mangujang.piknikYuk.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mangujang.piknikYuk.model.Discounts;

@Repository
public class DiscountDAOImpl implements DiscountDAO {
	
	//inject session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Discounts> getDiscounts() {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Discounts> selectAll =
					currentSession.createQuery("from Discounts", Discounts.class);
		
		// get query result
		List<Discounts> discounts = selectAll.getResultList();
		
		return discounts;
	}

	@Override
	public void saveDiscount(Discounts theDiscount) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save the discount
		currentSession.save(theDiscount);
		
	}
	
}
