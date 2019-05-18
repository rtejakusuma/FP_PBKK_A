package com.mangujang.piknikYuk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mangujang.piknikYuk.dao.OpeningDAO;
import com.mangujang.piknikYuk.model.OpeningHour;

@Service
public class OpeningServiceImpl implements OpeningService {
	
	//inject OpeningDAO
	@Autowired
	private OpeningDAO openingDAO;
	
	@Override
	@Transactional
	public List<OpeningHour> getOpening(int id) {
		// TODO Auto-generated method stub
		return openingDAO.getOpening(id);
	}

}
