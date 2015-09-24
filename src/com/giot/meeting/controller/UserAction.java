package com.giot.meeting.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.giot.meeting.entities.User;
import com.giot.meeting.service.UserService;
import com.giot.meeting.utils.MD5;

@Controller
public class UserAction {

	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping("/findUser.do")
	public User findUser(String nameid) {
		return userService.findUser(nameid);
	}

	@ResponseBody
	@RequestMapping("/getUser.do")
	public User getUser(String nameid, String password) {
		return userService.getUser(nameid, MD5.compute(password));
	}

	@ResponseBody
	@RequestMapping("/addUser.do")
	public String addUser(User user) {
		user.setPassword(MD5.compute(user.getPassword()));
		userService.addUser(user);
		return user.getUserid();
	}

	@ResponseBody
	@RequestMapping("/updateUser.do")
	public void updateUser(User user) {
		user.setUserid(userService.findUser(user.getNameid()).getUserid());
		user.setPassword(MD5.compute(user.getPassword()));
		userService.updateUser(user);
	}

	public String uploadImage(CommonsMultipartFile file,
			HttpServletRequest request, String nameid) {
		String pathDir = "/imagefiles";
		String realPathDir = request.getSession().getServletContext()
				.getRealPath(pathDir);
		File saveFile = new File(realPathDir);
		if (!saveFile.exists())
			saveFile.mkdirs();
		String name = file.getOriginalFilename();
		if (name.length() <= 0)
			return null;
		String extension = name.substring(name.indexOf("."));
		String fileName = realPathDir + File.separator + nameid + extension;
		File imageFile = new File(fileName);
		try {
			file.transferTo(imageFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pathDir.substring(1) + File.separator + nameid + extension;

	}

}
