package com.giot.meeting.service;

import java.sql.Timestamp;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.UserDao;
import com.giot.meeting.entities.User;
import com.giot.meeting.utils.MD5;

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
		//@javabean: 1:��һ����֤    0���ظ���֤
		int sta = userDao.getValidateStatus(userid);
		if(sta==0){
			userDao.updateValidateStatus(userid);
			return 1;
		}else{
			return 0;
		}
	}
	
	public User getOneUser(String username) {
		return userDao.getOneUser(username);
	}
	
	public User getUserById(String userid){
		return userDao.getUserById(userid);
	}
	
	public String createResetPasswordLink(String username) {
		
		String secretKey = UUID.randomUUID().toString();
		Timestamp outDate = new Timestamp(System.currentTimeMillis() + 30 * 60 * 1000);// 30分钟后过期
		long date = outDate.getTime() / 1000 * 1000;// 忽略毫秒数  mySql 取出时间是忽略毫秒数的
		userDao.createResetPasswordLink(username, secretKey, outDate);
		
		 String key =username + "$" + date + "$" + secretKey;
		 String digitalSignature = MD5.compute(key);// 数字签名
		 return digitalSignature;
	}
	
	public void resetPassword(String username, String password) {
		System.out.println(username);
		System.out.println(password);
		password = MD5.compute(password);
		System.out.println(password);
		userDao.resetPassword(username, password);
	}
	
}
