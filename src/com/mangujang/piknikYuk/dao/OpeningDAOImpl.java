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
//		Query selectAll = currentSession.createSQLQuery("select * from opening_hours where tour_location_id =:id")
//				.setParameter("id", id);
		
		Query selectAll = currentSession.createQuery("from OpeningHour where tourLocation.id = :id")
				.setParameter("id", id);
		
		//get query result
		List<OpeningHour> opening = selectAll.list();
						
		return opening;
	}

	@Override
	public void saveOpening(OpeningHour theOpening, int tourId, int flag) {
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Tour tempTour = currentSession.get(Tour.class, tourId);
		
		tempTour.add(theOpening);
		
		if(flag == 0) {
			currentSession.save(theOpening);
		} else if(flag == 1) {
			currentSession.saveOrUpdate(theOpening);
		}
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

	@SuppressWarnings("rawtypes")
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

	@SuppressWarnings("rawtypes")
	@Override
	public OpeningHour getIndex() {
		// TODO Auto-generated method stub
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query query = currentSession.createQuery("from OpeningHour order by id DESC");
		query.setMaxResults(1);
		OpeningHour last = (OpeningHour) query.uniqueResult();
		
		return last;
	}

}
