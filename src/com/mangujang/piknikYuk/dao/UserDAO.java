package com.mangujang.piknikYuk.dao;

import java.util.List;

import com.mangujang.piknikYuk.model.User;

public interface UserDAO {
	public List<User> getUsers();

	public void saveUser(User theUser);
}
