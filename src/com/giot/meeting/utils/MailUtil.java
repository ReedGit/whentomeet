package com.giot.meeting.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

@EnableAsync
@Component
public class MailUtil {
	
	private String port = null;
	private Session session = null;
	private Properties p = null;
	public void init(){
		//加载配置文件
		ClassLoader classLoader = MailUtil.class.getClassLoader();
		InputStream resourceAsStream = classLoader
				.getResourceAsStream("mail.properties");
		p = new Properties();
		try {
			p.load(resourceAsStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//props
		Properties props = new Properties();
		props.put("mail.smtp.host", p.getProperty("email.smtpserver"));
		props.put("mail.smtp.auth", "true");
		// session
		 session = Session.getDefaultInstance(props,
				new Authenticator() {
					public PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(
								p.getProperty("email.username"), 
								p.getProperty("email.password"));
					}
				});
	
		port = p.getProperty("email.port");
	}
	
	public MailUtil() {
		init();
	}
	
	@Async
	public void sendSigleMail(String to, String toName,String meetTheme,String meetId, String personId) {
		try {
			
			
			// MimeMessageֵ
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(p.getProperty("email.from")));
			//msg.setSubject(p.getProperty("email.subject"));
			msg.setSubject("汤姆聚会");
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));

			Multipart mp = new MimeMultipart();

			MimeBodyPart mbpContent = new MimeBodyPart();
			String contentHTML = null;
			if("-1".equals(personId)){
				//组织者
				contentHTML = "<h2>汤姆聚会</h2>"
						+"哈喽"+toName+"，<br>"
						+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您已成功发送邀请朋友们来参加 “"+meetTheme+"”。<br>"
						+"请点击下面的链接来查看受邀人员的回复情况吧：<br>"
						+"<a>"+port+"/whentomeet/replyTime.jsp?meetId="+meetId+"&personId="+personId+"</a>"
						+"<br><br><br>"
						+"感谢您使用汤姆聚会！"
						+"<br>--------<br>"
						+"南京吉奥客团队"
						+"<br><br>"
						+"南京吉奥客官网：<a href='http://www.geariot.com/'>http://www.geariot.com/</a><br>"
						+"客户服务热线&nbsp;&nbsp;&nbsp;：025-52265323 ";
			}else if("0".equals(personId)){
				//发送最终聚会的时间
				contentHTML = "<h2>汤姆聚会</h2>"
						+"哈喽"+toName+"，<br>"
						+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我们的聚会“"+meetTheme+"”。将在"+meetId+"举行<br>"
						+"一定要按时来参加我们的聚会哦<br>"
						+"<br><br><br>"
						+"感谢您使用汤姆聚会！"
						+"<br>--------<br>"
						+"南京吉奥客团队"
						+"<br><br>"
						+"南京吉奥客官网：<a href='http://www.geariot.com/'>http://www.geariot.com/</a><br>"
						+"客户服务热线&nbsp;&nbsp;&nbsp;：025-52265323 ";
				
			}else  if("2".equals(personId)){
				//发送邮箱验证
				 contentHTML = "<h3>"+to+"：</h3>"
						+"<p style='text-indent:20px'>您好，感谢您注册<a href='#'>汤姆聚会</a>，请点击下面的链接验证您的邮箱：</p><br>"
						+"<a href="+port+"'/whentomeet/updateValidateStatus.do?userid='"+meetId+">"+port+"/whentomeet/updateValidateStatus.do?userid="+meetId+"</a>"
						+"<br><br><br>"
						+"--------<br>"
						+"南京吉奥客团队"
						+"<br><br>"
						+"南京吉奥客官网：<a href='http://www.geariot.com/'>http://www.geariot.com/</a><br>"
						+"客户服务热线&nbsp;&nbsp;&nbsp;：025-52265323 ";
				
			}else if("3".equals(personId)){
				//发送重置密码链接
				contentHTML = "<p style='text-indent:20px'>您好，请点击下面的链接来重置你的密码：</p><br>"
						+"<a href="+port+"'/whentomeet/resetPasswordLink.do?sid='"+meetTheme+"&username="+meetId+">"+port+"/whentomeet/resetPasswordLink.do?sid="+meetTheme+"&username="+meetId+"</a>"
						+"<br><br><br>"
						+"请勿回复本邮件!<br>"
						+"--------<br>"
						+"南京吉奥客团队"
						+"<br><br>"
						+"南京吉奥客官网：<a href='http://www.geariot.com/'>http://www.geariot.com/</a><br>"
						+"客户服务热线&nbsp;&nbsp;&nbsp;：025-52265323 ";
			
			}else{
				//受邀人员
				contentHTML = "<h2>汤姆聚会</h2>"
						+"哈喽"+toName+"，<br>"
						+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邀请你去参加“"+meetTheme+"”。<br>"
						+"请点击下面的链接来参加我们的聚会吧：<br>"
						+"<a>"+port+"/whentomeet/replyTime.jsp?meetId="+meetId+"&personId="+personId+"</a>"
						+"<br><br><br>"
						+"感谢您使用汤姆聚会！"
						+"<br>--------<br>"
						+"南京吉奥客团队"
						+"<br><br>"
						+"南京吉奥客官网：<a href='http://www.geariot.com/'>http://www.geariot.com/</a><br>"
						+"客户服务热线&nbsp;&nbsp;&nbsp;：025-52265323 ";
			}
			
			
			
			
			mbpContent.setContent(contentHTML,
					"text/html;charset=utf-8");
			// mbpContent.setText(content);
			mp.addBodyPart(mbpContent);
			msg.setContent(mp);
			msg.setSentDate(new Date());
			Transport.send(msg);
			System.out.println(">>>>>>>>>>发送邮件给："+toName+"**邮箱为："+to+"**会议主题："+meetTheme);

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
}
