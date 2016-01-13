package com.giot.meeting.dao;

import java.sql.Timestamp;

import com.giot.meeting.entities.User;

public interface UserDao {

	public User getUser(String nameid, String password);
	
	public User getUserByup(String username,String password);
	
	public User getUserById(String userid);

	public User getUserByUsername(String username);
	
	public User getUserByNickname(String nickname);
	
	public boolean addUser(User user);

	public boolean updateUser(User user);
	
	public void createResetPasswordLink(String username,String secretKey,Timestamp outDate);
	
	public void resetPassword(String username,String password);
	
	public boolean findUser(String nameid);
	
	public User getOneUser(String username);
	
	public void updateValidateStatus(String userid);

	public int getValidateStatus(String userid);
	
}
