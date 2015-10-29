package com.giot.meeting.entities;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="CONTACT")
public class Contact {

	private String contactid;
	private String userid;
	private String invited;
	private String nickname;
	
	private String username;

	@Id
    @GenericGenerator(name = "generator", strategy = "uuid")
	@GeneratedValue(generator = "generator")// ×ÔÔö³¤
	public String getContactid() {
		return contactid;
	}

	public void setContactid(String contactid) {
		this.contactid = contactid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getInvited() {
		return invited;
	}

	public void setInvited(String invited) {
		this.invited = invited;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
