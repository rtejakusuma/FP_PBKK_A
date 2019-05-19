package com.mangujang.piknikYuk.dao;

import java.util.List;

import com.mangujang.piknikYuk.model.User;

public interface UserDAO {
	public List<User> getUsers();
	public User getUser(int theId);
	public void saveUser(User theUser);
	public void deleteUser(int theId);
	public boolean checkDuplicates(String username, String email);
}
