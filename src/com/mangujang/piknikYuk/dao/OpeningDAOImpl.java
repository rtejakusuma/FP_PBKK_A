package com.mangujang.piknikYuk.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mangujang.piknikYuk.model.OpeningHour;
import com.mangujang.piknikYuk.model.Tour;

@Repository
public class OpeningDAOImpl implements OpeningDAO {
	
	//inject session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<OpeningHour> getOpening(int id) {
		// TODO Auto-generated method stub
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//create a query		
		Query selectAll = currentSession.createSQLQuery("select * from opening_hours where tour_location_id =:id")
				.setParameter("id", id);
		
		//get query result
		List<OpeningHour> opening = selectAll.getResultList();
						
		return opening;
	}

	@Override
	public void saveOpening(OpeningHour theOpening, int tourId) {
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Tour tempTour = currentSession.get(Tour.class, tourId);
		
		tempTour.add(theOpening);
		
		//save/update the discout
		currentSession.saveOrUpdate(theOpening);
	}

	@Override
	public OpeningHour getOpenings(int id) {
		// TODO Auto-generated method stub
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//now retrieve/read from database using primary key
		OpeningHour theOpening = currentSession.get(OpeningHour.class, id);
		
		return theOpening;
	}

	@Override
	public void deleteOpening(int id) {
		// TODO Auto-generated method stub
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//delete object with primary key
		Query theQuery = currentSession.createQuery("delete from Discount where id=:openingId");
		theQuery.setParameter("openingId", id);
		
		theQuery.executeUpdate();
	}

}
