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

	public String addUser(User user) {
		return  userDao.addUser(user);
	}

	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	public boolean findUser(String nameid) {
		return userDao.findUser(nameid);
	}
	
	public int updateValidateStatus(String userid){
		//@javabean: 1:第一次验证    0：重复验证
		int sta = userDao.getValidateStatus(userid);
		if(sta==0){
			userDao.updateValidateStatus(userid);
			return 1;
		}else{
			return 0;
		}
	}
	
	public User getUserById(String userid){
		return userDao.getUserById(userid);
	}
	
}
