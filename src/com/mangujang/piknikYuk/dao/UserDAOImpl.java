package com.mangujang.piknikYuk.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mangujang.piknikYuk.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
	
	// inject session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<User> getUsers() {
		
		// get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		// create a query
		Query<User> theQuery = 
				currentSession.createQuery("from User", User.class);
		
		// execute query & get result list
		List<User> users = theQuery.getResultList();
		
		// return the results
		return users;
	}

}
