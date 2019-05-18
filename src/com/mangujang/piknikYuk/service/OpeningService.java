package com.mangujang.piknikYuk.service;

import java.util.List;

import com.mangujang.piknikYuk.model.OpeningHour;

public interface OpeningService {
	public List<OpeningHour> getOpening(int id);
	
}
