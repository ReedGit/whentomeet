package com.giot.meeting.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.giot.meeting.entities.Contact;
import com.giot.meeting.entities.Person;
import com.giot.meeting.entities.User;
import com.giot.meeting.service.ContactService;
import com.giot.meeting.service.MeetingService;
import com.giot.meeting.service.PersonService;
import com.giot.meeting.service.UserService;
import com.giot.meeting.utils.MailUtil;

@Controller
public class SendmailAction {
	@Autowired
	private PersonService personService;
	@Autowired
	private ContactService contactService;
	@Autowired
	private MeetingService meetingService;
	@Autowired
	private UserService userService;
	@Autowired
	private MailUtil mu;

	@RequestMapping("/sendtoMail.do")
	public String sendtoMail(String[] attendeeName, String[] attendeeEmail,
			String meetId, String selfEmail, String myName, String meetTheme,
			HttpSession session) throws AddressException {
		System.out.println("发送邀请邮件信息 :受邀人姓名　"+Arrays.toString(attendeeName));
		System.out.println("发送邀请邮件信息：受邀人邮箱　"+Arrays.toString(attendeeEmail));
		System.out.println("发送邀请邮件信息：meetId　"+meetId);
		System.out.println("发送邀请邮件信息：自己的邮箱　"+selfEmail);
		System.out.println("发送邀请邮件信息：我的名字　"+myName);
		System.out.println("发送邀请邮件信息：主题"+meetTheme);
		
		
		User us = (User) session.getAttribute("user1");

		List<String> li = new ArrayList<String>();
		List<String> attName = new ArrayList<String>();

		for (int i = 0; i < attendeeEmail.length; i++) {
			if (attendeeEmail[i] != "") {
				li.add(attendeeEmail[i]);
				attName.add(attendeeName[i]);
			}
		}

		for (int i = 0; i < li.size(); i++) {
			//增加对重复联系人的发送邮件以及添加进行过滤 @javebean
			if(!personService.getPerson(meetId, attendeeEmail[i])){
				Person p1 = new Person();
				p1.setMeetid(meetId);
				p1.setName(attName.get(i));
				p1.setPersonEmail(li.get(i));
				personService.addPerson(p1);
			
			System.out.println(us + "################");
			System.out.println(us != null);
			if (us != null) {
				Contact con = new Contact();
				con.setNickname(attName.get(i));
				con.setUserid(us.getUserid());
				con.setUsername(li.get(i));
				contactService.addContact(con);

			}

				mu.sendSigleMail(li.get(i), attName.get(i), meetTheme, meetId,
					p1.getPersonid());
			}
		}

		if (us == null) {
			mu.sendSigleMail(selfEmail, myName, meetTheme, meetId, "-1");
			return "redirect:sendSuccess.jsp?selfEmail=" + selfEmail;
		}
		return "redirect:sendSuccess.jsp";
	}

	/**
	 * 手机端发送邮件接口 这里多出一个meetTheme参数，传参的时候注意一下
	 */

	@ResponseBody
	@RequestMapping("/sendMailForPhone.do")
	public String sendMailForPhone(String meetId, String userId,
			String emailString, String nameString, String meetTheme) {
		JSONObject result = new JSONObject();
		String[] attendeeEmail = emailString.split(";;");
		String[] attendeeName = nameString.split(";;");

		for (int i = 0; i < attendeeEmail.length - 1; i++) {
			
			String attName = attendeeName[i];
			String attEmail = attendeeEmail[i];
			//增加对重复联系人的发送邮件以及添加进行过滤 @javebean
			if(!personService.getPerson(meetId, attEmail)){
				Person p1 = new Person();
				p1.setMeetid(meetId);
				p1.setName(attName);
				p1.setPersonEmail(attEmail);
				personService.addPerson(p1);
				Contact con = new Contact();
				con.setNickname(attName);
				con.setUserid(userId);
				con.setUsername(attEmail);
				contactService.addContact(con);
				
				mu.sendSigleMail(attEmail, attName, meetTheme, meetId,
						p1.getPersonid());
			}
			
		}
		result.put("result", true);
		return result.toString();

	}

	public void sendValidate(String registerEmail, String userid) {
		// ！！！！javabean:验证邮箱，将meetId这个参数作为 userid 传过去
		System.out.println("ddddd-"+mu);
		mu.sendSigleMail(registerEmail, "", "", userid, "2");
	}

	@ResponseBody
	@RequestMapping("/sendDecideTime.do")
	public boolean sendDecideTime(String contactEmail, String contactName,
			String meetTheme, String week, String time, String meetId,
			int confirmTimeOrder) {
		System.out.println("发送给受邀人邮箱----------->" + contactEmail);
		System.out.println("发送给首要人姓名-----------》" + contactName);
		meetingService.setConfirmTime(meetId, week + "#" + time,
				confirmTimeOrder);
		// may not name match email?
		String contactEmailarr[] = toArray(contactEmail);
		String contactNamearr[] = toArray(contactName);
		// ！！！！javabean:发送最终决定时间，将meetId这个参数作为最终确定的时间传过去
		System.out.println("最终确定的时间为：" + week + " " + time);
		for (int i = 0; i < contactEmailarr.length; i++) {
			mu.sendSigleMail(contactEmailarr[i], contactNamearr[i], meetTheme,
					week + " " + time, "0");
		}
		return true;
	}

	private String[] toArray(String str) {
		String s = clipBorder(str);
		String[] split = s.split(",");
		for (int i = 0; i < split.length; i++) {
			split[i] = clipBorder(split[i]);
		}
		return split;
	}

	private String clipBorder(String str) {
		return str.substring(1, str.length() - 1);
	}
	
	@ResponseBody
	@RequestMapping("/sendResetPasswordLink.do")
	public void sendResetPasswordLink(String email){
		String digitalSignature = userService.createResetPasswordLink(email);
		mu.sendSigleMail(email, null, digitalSignature, email, "3");
	}

}
