package com.giot.meeting.dao;

import com.giot.meeting.entities.User;

public interface UserDao {

	public User getUser(String nameid, String password);

	public void addUser(User user);

	public void updateUser(User user);
	
	public User findUser(String nameid);

	public void updateValidateStatus(String userid);
}
