package com.mangujang.piknikYuk.service;

import java.util.List;

import com.mangujang.piknikYuk.model.User;

public interface UserService {
	
	public List<User> getUsers();	
	public User getUser(int theId);	
	public void saveUser(User theUser);
	public void deleteUser(int theId);
	
}
