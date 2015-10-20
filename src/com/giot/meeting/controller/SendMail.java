package com.giot.meeting.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.giot.meeting.entities.Person;
import com.giot.meeting.entities.User;
import com.giot.meeting.service.PersonService;

@Controller
public class SendMail {
	MimeMessage msg = null;
	
	@Autowired
	private PersonService personService;
	
	public SendMail() throws Exception {
		ClassLoader classLoader = SendMail.class.getClassLoader();
		InputStream resourceAsStream = classLoader.getResourceAsStream("mail.properties");
		final Properties p = new Properties();
		p.load(resourceAsStream);
		// 创建邮件Session所需的Properties对象
		Properties props = new Properties();
		props.put("mail.smtp.host", p.getProperty("email.smtpserver"));
		props.put("mail.smtp.auth", "true");
		// 创建Session对象
		Session session = Session.getDefaultInstance(props , new Authenticator() {
					public PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(p.getProperty("email.username"), p.getProperty("email.password"));
					}
				});
		// 构造MimeMessage并设置相关属性值
		 msg = new MimeMessage(session);
		// 设置发件人
		msg.setFrom(new InternetAddress(p.getProperty("email.from")));
		msg.setSubject(p.getProperty("email.subject"));
	}

	// 发送邮件
	@Async
	@RequestMapping("/sendtoMail.do")
	public String sendtoMail(String[] attendeeName, String[] attendeeEmail,
			String meetId,String selfEmail,HttpSession session) throws AddressException {
		
		User us = (User) session.getAttribute("user1");
		if(us==null){
			sendSigleMail(selfEmail, meetId, "-1");
		}
		
		List<String> li = new ArrayList<String>();
		List<String> attName = new ArrayList<String>();

		for (int i = 0; i < attendeeEmail.length; i++) {
			if (attendeeEmail[i] != "") {
				li.add(attendeeEmail[i]);
				attName.add(attendeeName[i]);
			}
		}


		for (int i = 0; i < li.size(); i++) {
			Person p1 = new Person();
			p1.setMeetid(meetId); 
			p1.setName(attName.get(i));
			personService.addPerson(p1);
			sendSigleMail(li.get(i), meetId, p1.getPersonid());
		}
		return "redirect:sendSuccess.jsp";
	}

	public void sendSigleMail(String to,String meetId,String personId) {
		try {
			// 设置收件人
			msg.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
			// 构造Multipart
			Multipart mp = new MimeMultipart();
			// 向Multipart添加正文
			MimeBodyPart mbpContent = new MimeBodyPart();
			mbpContent.setContent("http://localhost:8282/whentomeet/replyTime.jsp?meetId="+meetId +"&personId="+personId,"text/html;charset=utf-8");
			// mbpContent.setText(content);
			// 将BodyPart添加到MultiPart中
			mp.addBodyPart(mbpContent);
			msg.setContent(mp);
			// 设置发送日期
			msg.setSentDate(new Date());
			// 发送邮件
			Transport.send(msg);

		} catch (MessagingException mex) {
			mex.printStackTrace();

		}
	}
	
	public void sendValidate(String registerEmail,String userid){
		try {
			// 设置收件人
			msg.setRecipient(Message.RecipientType.TO,new InternetAddress(registerEmail));
			// 构造Multipart
			Multipart mp = new MimeMultipart();
			// 向Multipart添加正文
			MimeBodyPart mbpContent = new MimeBodyPart();
			mbpContent.setContent("http://localhost:8282/whentomeet/updateValidateStatus.do?userid="+userid,"text/html;charset=utf-8");
			// mbpContent.setText(content);
			// 将BodyPart添加到MultiPart中
			mp.addBodyPart(mbpContent);
			msg.setContent(mp);
			// 设置发送日期
			msg.setSentDate(new Date());
			// 发送邮件
			Transport.send(msg);

		} catch (MessagingException mex) {
			mex.printStackTrace();

		}
	}
	
}