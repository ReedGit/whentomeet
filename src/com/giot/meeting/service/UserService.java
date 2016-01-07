package com.giot.meeting.service;

import java.sql.Timestamp;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.controller.SendmailAction;
import com.giot.meeting.dao.UserDao;
import com.giot.meeting.entities.User;
import com.giot.meeting.utils.Iso8859_utf8;
import com.giot.meeting.utils.MD5;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public String getUser(String username, String password) {
		User u =  userDao.getUser(username, password);
		JSONObject obj = new JSONObject();
		if(u==null){
			obj.put("code", 1);
			obj.put("message", "用户名或者密码错误");
			return obj.toString();
		}else if(u.getValidate()==0){
			obj.put("code", 1);
			obj.put("message", "该邮箱没有验证");
			return obj.toString();
		}else{
			JSONObject obj2 = new JSONObject();
			obj2.put("nickname", u.getNickname());
			obj2.put("username", u.getUsername());
			obj2.put("userId", u.getUserid());
			obj.put("code", 0);
			obj.put("message", obj2);
			return obj.toString();
			
		}
	}

	public String addUser(User user,SendmailAction sendmail ) {
		String username = user.getUsername();
		System.out.println("注册的用户名："+username);
		User u = userDao.getUserByUsername(username);
		System.out.println(u);
		JSONObject obj = new JSONObject();
		if(u!=null){
			//用户已存在
			obj.put("code", 2);
			obj.put("message", "该邮箱已存在");
			return obj.toString();
		}
		user.setNickname(Iso8859_utf8.transfrom(user.getNickname()));
		user.setPassword(MD5.compute(user.getPassword()));
		
		boolean b=  userDao.addUser(user);
		if(b){
			obj.put("code", 0);
			obj.put("message", "注册成功");
			sendmail.sendValidate(user.getUsername(), user.getUserid());
			return obj.toString();
		}else{
			obj.put("code", 1);
			obj.put("message", "注册失败");
			return obj.toString();
		}
	}

	public String updateUser(User user) {
		JSONObject obj = new JSONObject();
		String pass = user.getPassword();
		
		
		System.out.println("-------------"+pass);
		
		
		if(null!=pass&&!"".equals(pass)){
			//修改密码
			String username = Iso8859_utf8.transfrom(user.getUsername());
			String[] passes = pass.split(",");
			System.out.println("查询的用户 "+ username+" 密码 "+passes[0]+"md5  "+MD5.compute(passes[0]));
			User user2 = userDao.getUserByup(username, MD5.compute(passes[0]));
			
			if(user2==null){
				obj.put("code", 1);
				obj.put("message", "旧密码不正确");
				return obj.toString();
			}else{
				String newPass = passes[1];
				user.setPassword(newPass);
			}
			
		}
		
		boolean b = userDao.updateUser(user);
		if(b){
			obj.put("code", 0);
			obj.put("message", "更新成功");
		}else{
			obj.put("code", 1);
			obj.put("message", "更新失败");
		}
		return obj.toString();
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
	
	public String getDefaultDura(String username){
		User u = userDao.getUserByUsername(username);
		JSONObject obj = new JSONObject();
		if(null!=u){
			int dura =  u.getDefaultDura();
			obj.put("code", 0);
			obj.put("message", dura);
		}else{
			obj.put("code", 1);
			obj.put("message", "查询默认时长失败");
		}
		return obj.toString();
	}
	
}
