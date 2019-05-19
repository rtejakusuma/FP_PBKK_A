package com.mangujang.piknikYuk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mangujang.piknikYuk.dao.TourDAO;
import com.mangujang.piknikYuk.model.Tour;

@Service
public class TourServiceImpl implements TourService {

	// inject tourDAO
	@Autowired
	private TourDAO tourDAO;
	
	@Override
	@Transactional
	public List<Tour> getTours() {
		return tourDAO.getTours();
	}

	@Override
	@Transactional
	public void saveTour(Tour theTour) {
		// TODO Auto-generated method stub
		tourDAO.saveTour(theTour);
	}

	@Override
	@Transactional
	public Tour getTour(int theId) {
		// TODO Auto-generated method stub
		return tourDAO.getTour(theId);
	}

	@Override
	public void deleteTour(int theId) {
		// TODO Auto-generated method stub
		tourDAO.deleteTour(theId);
	}

}
