package com.mangujang.piknikYuk.testDb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.mangujang.piknikYuk.model.OpeningHour;
import com.mangujang.piknikYuk.model.Tour;

@Repository
public class TourHourTest {
	
	public static void main(String[] args) throws ParseException {
				
		// create session factory
		SessionFactory factory = new Configuration()
									.configure("hibernate.cfg.xml")
									.addAnnotatedClass(Tour.class)
									.addAnnotatedClass(OpeningHour.class)
									.buildSessionFactory();
		
		// create session
		Session session = factory.getCurrentSession();
		
		try {
			
			// create the objects
			// Tour tempTour = new Tour("Name", "Description boi", "Up Dog");
			
			//-- set a transaction --//
			session.beginTransaction();
			
			// save the object
			// System.out.println("Saving Tour data object ..");
			// session.save(tempTour);
			
			// get Tour object
			int theId = 1;
			Tour tempTour = session.get(Tour.class, theId);
			
			// create some openingHours
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
			OpeningHour openingHour1 = new OpeningHour(1, sdf.parse("12:00:00"), sdf.parse("21:00:00"));
			OpeningHour openingHour2 = new OpeningHour(2, sdf.parse("12:00:00"), sdf.parse("21:00:00"));
			OpeningHour openingHour3 = new OpeningHour(3, sdf.parse("12:00:00"), sdf.parse("21:00:00"));
			
			// add openingHours to tempTour
			tempTour.add(openingHour1);
			tempTour.add(openingHour2);
			tempTour.add(openingHour3);
			
			// save the openingHours
			session.save(openingHour1);
			session.save(openingHour2);
			session.save(openingHour3);
			
			//-- commit the transaction --//
			session.getTransaction().commit();
			System.out.println("Done !!");
			
		} finally {
			// clean up code
			session.close();
			factory.close();
		}
		
	}

}
