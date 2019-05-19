package com.mangujang.piknikYuk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mangujang.piknikYuk.dao.UserDAO;
import com.mangujang.piknikYuk.model.User;

@Service
public class UserServiceImpl implements UserService {
	
	// need to inject userDAO
	@Autowired
	private UserDAO userDAO;
	
	@Override
	@Transactional
	public List<User> getUsers() {		
		return userDAO.getUsers();		
	}

	@Override
	@Transactional
	public void saveUser(User theUser) {
		// TODO Auto-generated method stub
		userDAO.saveUser(theUser);
	}

	@Override
	@Transactional
	public User getUser(int theId) {		
		return userDAO.getUser(theId);
	}

	@Override
	@Transactional
	public void deleteUser(int theId) {
		userDAO.deleteUser(theId);		
	}

	@Override
	@Transactional
	public boolean checkDuplicates(String username, String email) {		
		return userDAO.checkDuplicates(username, email);
	}

}
