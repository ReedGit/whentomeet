package com.giot.meeting.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Autowired
	private SendmailAction sendmail;
	
	@ResponseBody
	@RequestMapping("/findUser.do")
	public boolean findUser(String username) {
		return userService.findUser(username);
	}

	@ResponseBody
	@RequestMapping(value="/getUser.do",produces="text/html;charset=UTF-8")
	public String getUser(String username, String password) {
		String str =  userService.getUser(username, MD5.compute(password));
		return str;
	}
	
	@ResponseBody
	@RequestMapping("/getUserById.do")
	public User getUserById(String userid) {
		User u =  userService.getUserById(userid);
		return u;
	}
	
	@ResponseBody
	@RequestMapping(value="/addUser.do", produces = "text/html;charset=UTF-8")
	public String addUser(User user) {
		String s = userService.addUser(user,sendmail);
		return s;
	}

	@RequestMapping("/redirectValidateEmail.do")
	public String redirectValidateEmail(){
		return "validateEmail";
	}
	
	
	@ResponseBody
	@RequestMapping("/updatePassword.do")
	public boolean updatePassword(String userid, String oldpassword, String password) {
		User user = userService.getUserById(userid);
		
		if (user.getPassword().equals(MD5.compute(oldpassword))) {
			user.setPassword(MD5.compute(password));
			userService.updateUser(user);
			return true;
		}else{
			return false;
		}
	}
	
	@RequestMapping("/resetPasswordLink.do")
	public String resetPasswordLink(String username,String sid,Model model){
		if ("".equals(username)  || "".equals(sid)||username==null||sid==null) {
			model.addAttribute("mes","链接不完整，请重新生成。");
			return  "redirect:resetPassValidate.html?mes={mes}";
        }
		
		User user = userService.getOneUser(username);
		 Timestamp outDate = (Timestamp) user.getOutDate();
		 if(outDate.getTime() <= System.currentTimeMillis()){ //表示已经过期
			 model.addAttribute("mes", "链接已经过期，请重新申请找回密码。");
			 return  "redirect:resetPassValidate.html?mes={mes}";
         }
		 
		 String key = user.getUsername()+"$"+outDate.getTime()/1000*1000+"$"+user.getSecretKey();//数字签名
		 System.out.println("验证的key:"+key);
		 
		 String digitalSignature = MD5.compute(key);// 数字签名
		 System.out.println("数字签名："+digitalSignature);
		 if(!digitalSignature.equals(sid)) {
			 model.addAttribute("mes", "链接不正确，是否已经过期了？重新申请吧。");
			 return  "redirect:resetPassValidate.html?mes={mes}";
         }else {
           return "redirect:resetpass.html";
       }
		 
	}
	
	@ResponseBody
	@RequestMapping("/resetPassword.do")
	public void resetPassword(String username,String password){
		userService.resetPassword(username, password);
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
		return "redirect:validateState.html?sta="+sta;
	}

	@ResponseBody
	@RequestMapping("/removeUser.do")
	public boolean removeUser(HttpSession session){
		session.removeAttribute("user1");
		return true;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateUser.do",produces="text/html;charset=UTF-8")
	public String updateUser(User user){
		return userService.updateUser(user);
	}
	
	@ResponseBody
	@RequestMapping(value="/getdura.do",produces="text/html;charset=UTF-8")
	public String getDefaultDura(String username){
		return userService.getDefaultDura(username);
	}
	
}
