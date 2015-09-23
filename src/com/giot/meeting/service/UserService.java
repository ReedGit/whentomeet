package com.giot.meeting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.UserDao;
import com.giot.meeting.entities.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public User getUser(String nameid, String password) {
		return userDao.getUser(nameid, password);
	}

	public void addUser(User user) {
		userDao.addUser(user);
	}

	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	public User findUser(String nameid) {
		return userDao.findUser(nameid);
	}

}
