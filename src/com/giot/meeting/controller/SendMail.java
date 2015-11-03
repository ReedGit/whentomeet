package com.giot.meeting.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
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

import jdk.nashorn.api.scripting.JSObject;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.giot.meeting.entities.Contact;
import com.giot.meeting.entities.Person;
import com.giot.meeting.entities.User;
import com.giot.meeting.service.ContactService;
import com.giot.meeting.service.PersonService;
import com.google.gson.JsonObject;

@Controller
public class SendMail {
	MimeMessage msg = null;
	private String port = null;
	@Autowired
	private PersonService personService;

	@Autowired
	private ContactService contactService;

	public SendMail() throws Exception {
		ClassLoader classLoader = SendMail.class.getClassLoader();
		InputStream resourceAsStream = classLoader
				.getResourceAsStream("mail.properties");
		final Properties p = new Properties();
		p.load(resourceAsStream);
		// �����ʼ�Session�����Properties����
		Properties props = new Properties();
		props.put("mail.smtp.host", p.getProperty("email.smtpserver"));
		props.put("mail.smtp.auth", "true");
		// ����Session����
		Session session = Session.getDefaultInstance(props,
				new Authenticator() {
					public PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(p
								.getProperty("email.username"), p
								.getProperty("email.password"));
					}
				});
		// ����MimeMessage�������������ֵ
		msg = new MimeMessage(session);
		// ���÷�����
		msg.setFrom(new InternetAddress(p.getProperty("email.from")));
		msg.setSubject(p.getProperty("email.subject"));

		port = p.getProperty("email.port");
	}

	// �����ʼ�
	@Async
	@RequestMapping("/sendtoMail.do")
	public String sendtoMail(String[] attendeeName, String[] attendeeEmail,
			String meetId, String selfEmail, HttpSession session)
			throws AddressException {
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
			sendSigleMail(li.get(i), meetId, p1.getPersonid());
		}

		if (us == null) {
			sendSigleMail(selfEmail, meetId, "-1");
			return "redirect:sendSuccess.jsp?selfEmail=" + selfEmail;
		}
		return "redirect:sendSuccess.jsp";
	}

	/**
	 * 手机端发送邮件接口
	 * @param meetId
	 * @param userId
	 * @param emailString
	 * @param nameString
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/sendMailForPhone.do")
	public String sendMailForPhone(String meetId, String userId,
			String emailString, String nameString) {
		JSONObject result = new JSONObject();
		List<String> li = new ArrayList<String>();
		List<String> attName = new ArrayList<String>();
		String[] attendeeEmail = emailString.split(";;");
		String[] attendeeName = nameString.split(";;");
		for (int i = 0; i < attendeeEmail.length - 1; i++) {
			li.add(attendeeEmail[i]);
			attName.add(attendeeName[i]);
		}

		for (int i = 0; i < li.size(); i++) {
			Person p1 = new Person();
			p1.setMeetid(meetId);
			p1.setName(attName.get(i));
			p1.setPersonEmail(li.get(i));
			personService.addPerson(p1);
			Contact con = new Contact();
			con.setNickname(attName.get(i));
			con.setUserid(userId);
			con.setUsername(li.get(i));
			contactService.addContact(con);
			sendSigleMail(li.get(i), meetId, p1.getPersonid());
		}
		result.put("result", true);
		return result.toString();

	}

	public void sendSigleMail(String to, String meetId, String personId) {
		try {
			// �����ռ���
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// ����Multipart
			Multipart mp = new MimeMultipart();
			// ��Multipart�������
			MimeBodyPart mbpContent = new MimeBodyPart();

			mbpContent.setContent(port + "/whentomeet/replyTime.jsp?meetId="
					+ meetId + "&personId=" + personId,
					"text/html;charset=utf-8");
			// mbpContent.setText(content);
			// ��BodyPart��ӵ�MultiPart��
			mp.addBodyPart(mbpContent);
			msg.setContent(mp);
			// ���÷�������
			msg.setSentDate(new Date());
			// �����ʼ�
			Transport.send(msg);

		} catch (MessagingException mex) {
			System.out
					.println("�ʼ�����ʧ�ܡ��������������ã�������****************");
			mex.printStackTrace();

		}
	}

	public void sendValidate(String registerEmail, String userid) {
		try {
			System.out
					.println("������֤�ʼ�������������������������������������");
			// �����ռ���
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(
					registerEmail));
			// ����Multipart
			Multipart mp = new MimeMultipart();
			// ��Multipart�������
			MimeBodyPart mbpContent = new MimeBodyPart();
			mbpContent.setContent(port
					+ "/whentomeet/updateValidateStatus.do?userid=" + userid,
					"text/html;charset=utf-8");
			// mbpContent.setText(content);
			// ��BodyPart��ӵ�MultiPart��
			mp.addBodyPart(mbpContent);
			msg.setContent(mp);
			// ���÷�������
			msg.setSentDate(new Date());
			// �����ʼ�
			Transport.send(msg);

		} catch (MessagingException mex) {
			mex.printStackTrace();

		}
	}

	// Ⱥ��������Ϣ
	@ResponseBody
	@RequestMapping("/sendDecideTime.do")
	public boolean sendDecideTime(String personTime, String week, String time) {

		personTime = clipBorder(personTime);
		String arr[] = personTime.split(",");
		for (int i = 0; i < arr.length; i++) {
			arr[i] = clipBorder(arr[i]);
		}

		InternetAddress[] address = new InternetAddress[arr.length];

		try {
			System.out
					.println("������֤�ʼ�������������������������������������");
			System.out.println("���͵���ϵ�ˣ�---��" + Arrays.toString(arr));
			for (int i = 0; i < arr.length; i++) {
				address[i] = new InternetAddress(arr[i]);
			}
			// �����ռ���
			msg.setRecipients(Message.RecipientType.TO, address);
			// ����Multipart
			Multipart mp = new MimeMultipart();
			// ��Multipart�������
			MimeBodyPart mbpContent = new MimeBodyPart();
			mbpContent.setContent("�˴ξۻ��ʱ�䶨Ϊ��" + week + " " + time,
					"text/html;charset=utf-8");
			// mbpContent.setText(content);
			// ��BodyPart��ӵ�MultiPart��
			mp.addBodyPart(mbpContent);
			msg.setContent(mp);
			// ���÷�������
			msg.setSentDate(new Date());
			// �����ʼ�
			Transport.send(msg);

		} catch (MessagingException mex) {
			mex.printStackTrace();

		}

		return true;

	}

	private String clipBorder(String string) {
		return string.substring(1, string.length() - 1);
	}

}