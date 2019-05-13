package com.mangujang.piknikYuk.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mangujang.piknikYuk.model.Discount;

@Repository
public class DiscountDAOImpl implements DiscountDAO {
	
	//inject session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Discount> getDiscounts() {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Discount> selectAll =
					currentSession.createQuery("from Discount", Discount.class);
		
		// get query result
		List<Discount> discounts = selectAll.getResultList();
		
		return discounts;
	}

	@Override
	public void saveDiscount(Discount theDiscount) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// save/update the discount
		currentSession.saveOrUpdate(theDiscount);		
	}

	@Override
	public Discount getDiscount(int theId) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// now retrieve/read from database using the primary key
		Discount theDiscount = currentSession.get(Discount.class, theId);
		
		return theDiscount;
	}

	@Override
	public void deleteDiscount(int theId) {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//delete object with primary key
		Query theQuery = currentSession.createQuery("delete from Discount where id=:discountId");
		theQuery.setParameter("discountId", theId);
		
		theQuery.executeUpdate();
	}
	
}
