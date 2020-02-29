package com.gm.dao;

import com.gm.domain.User;

public interface UserDao {

	void addUser(User user);

	User findUser(String username, String password);

	User findUserByCode(String code);

	void update(User user);

}
