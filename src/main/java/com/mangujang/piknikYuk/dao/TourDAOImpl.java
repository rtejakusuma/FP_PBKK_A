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

	@Override
	public void saveTour(Tour theTour) {
		
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//save/update the tour
		currentSession.saveOrUpdate(theTour);
		
	}

	@Override
	public Tour getTour(int theId) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//now retrieve/read from database using the primary key
		Tour theTour = currentSession.get(Tour.class, theId);
		
		return theTour;
	}

	@Override
	public void deleteTour(int theId) {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//delete object with primary key
		Query theQuery = currentSession.createQuery("delete from Tour where id=:tourId");
		theQuery.setParameter("tourId", theId);
		
		theQuery.executeUpdate();
		
	}

}
