package com.mangujang.piknikYuk.service;

import java.util.List;

import com.mangujang.piknikYuk.model.Tour;

public interface TourService {

	public List<Tour> getTours();
	
	public void saveTour(Tour theTour);
	
	public Tour getTour(int theId);
	
	public void deleteTour(int theId);
	
}
