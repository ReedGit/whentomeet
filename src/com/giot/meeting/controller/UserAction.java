package com.giot.meeting.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.giot.meeting.entities.User;
import com.giot.meeting.service.UserService;
import com.giot.meeting.utils.MD5;

@Controller
public class UserAction {

	@Autowired
	private UserService userService;
	@Autowired
	private SendMail sendmail;
	
	@ResponseBody
	@RequestMapping("/findUser.do")
	public boolean findUser(String username) {
		return userService.findUser(username);
	}

	@ResponseBody
	@RequestMapping("/getUser.do")
	public User getUser(String username, String password,HttpSession session) {
		User u =  userService.getUser(username, MD5.compute(password));
		if(u!=null){
			session.setAttribute("user1", u);
		}
		return u;
	}
	
	@ResponseBody
	@RequestMapping("/getUserById.do")
	public User getUserById(String userid) {
		User u =  userService.getUserById(userid);
		return u;
	}

	@RequestMapping("/addUser.do")
	public String addUser(User user,RedirectAttributes redirectAttributes) {

		user.setPassword(MD5.compute(user.getPassword()));
		user.setRegisterDate(new Date());
		/*user.setImage(uploadImage(file, request, user.getNameid()));*/
		userService.addUser(user);
		sendmail.sendValidate(user.getUsername(), user.getUserid());
		redirectAttributes.addFlashAttribute("provEmail", user.getUsername());
		return "redirect:/redirectValidateEmail.do";
	}

	@RequestMapping("/redirectValidateEmail.do")
	public String redirectValidateEmail(){
		return "validateEmail";
	}
	
	
	@ResponseBody
	@RequestMapping("/updatePassword.do")
	public boolean updatePassword(String userid, String oldpassword, String password) {
		User user = userService.getUserById(userid);
		
		if (user.getPassword().endsWith(MD5.compute(oldpassword))) {
			user.setPassword(MD5.compute(password));
			userService.updateUser(user);
			return true;
		}else{
			return false;
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
		String image = uploadImage(file, request, user.getUsername());
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
	
	@RequestMapping("/updateValidateStatus.do")
	public String updateValidateStatus(String userid) {
		int sta = userService.updateValidateStatus(userid);
		return "redirect:validateSuc.jsp?sta="+sta;
	}

	@ResponseBody
	@RequestMapping("/removeUser.do")
	public boolean removeUser(HttpSession session){
		session.removeAttribute("user1");
		return true;
	}
	
	@ResponseBody
	@RequestMapping("/updateUser.do")
	public boolean updateUser(User user){
		userService.updateUser(user);
		return true;
	}
}
