package com.mangujang.piknikYuk.service;

import java.util.List;

import com.mangujang.piknikYuk.model.OpeningHour;

public interface OpeningService {
	public List<OpeningHour> getOpening(int id);
	
	public void saveOpening(OpeningHour theOpening, int tourId, int flag);
	
	public OpeningHour getOpenings(int id);
	
	public void deleteOpening(int id);
	
	public OpeningHour getIndex();
}
