package com.mangujang.piknikYuk.dao;

import java.util.List;

import com.mangujang.piknikYuk.model.OpeningHour;

public interface OpeningDAO {

	public List<OpeningHour> getOpening(int id);
	
	public void saveOpening(OpeningHour theOpening, int tourId);
	
	public OpeningHour getOpenings(int id);
	
	public void deleteOpening(int id);

}
