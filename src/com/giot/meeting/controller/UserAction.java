package com.giot.meeting.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String addUser(User user,
			@RequestParam("imagefile") CommonsMultipartFile file,
			HttpServletRequest request) {
		user.setPassword(MD5.compute(user.getPassword()));
		user.setImage(uploadImage(file, request, user.getNameid()));
		userService.addUser(user);
		return user.getUserid();
	}

	@ResponseBody
	@RequestMapping("/updatePassword.do")
	public void updatePassword(String nameid, String oldPassword, String password) {
		User user = userService.getUser(nameid, MD5.compute(oldPassword));
		if (user != null) {
			user.setPassword(MD5.compute(password));
			userService.updateUser(user);
		}
	}
	
	@ResponseBody
	@RequestMapping("/updateUsername.do")
	public void updateUsername(User user,String username) {
		if (user != null) {
			user.setUsername(username);
			userService.updateUser(user);
		}
	}

	@ResponseBody
	@RequestMapping("/updateImage.do")
	public void updateImage(User user,
			@RequestParam("imagefile") CommonsMultipartFile file,
			HttpServletRequest request) {
		String image = uploadImage(file, request, user.getNameid());
		if (image != null)
			user.setImage(image);
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
