package com.mangujang.piknikYuk.dao;

import java.util.List;

import com.mangujang.piknikYuk.model.Tour;

public interface TourDAO {
	public List<Tour> getTours();
	
	public void saveTour(Tour theTour);
	
	public Tour getTour(int theId);
	
	public void deleteTour(int theId);
}
