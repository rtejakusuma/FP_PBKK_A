package com.mangujang.piknikYuk.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mangujang.piknikYuk.model.Tour;

@Repository
public class TourDAOImpl implements TourDAO {
	
	// inject session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Tour> getTours() {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<Tour> selectAll  =
				currentSession.createQuery("from Tour", Tour.class);
		
		// execute query & get result list
		List<Tour> tours = selectAll.getResultList();
		
		return tours;
	}

}
