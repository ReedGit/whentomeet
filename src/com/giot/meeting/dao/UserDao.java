package com.giot.meeting.dao;

import com.giot.meeting.entities.User;

public interface UserDao {

	public User getUser(String nameid, String password);
	
	public User getUserById(String userid);

	public void addUser(User user);

	public void updateUser(User user);
	
	public boolean findUser(String nameid);

	public void updateValidateStatus(String userid);

	public int getValidateStatus(String userid);
	
}
