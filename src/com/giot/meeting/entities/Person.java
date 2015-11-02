package com.giot.meeting.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="PERSON")
public class Person {
	
	private String personid;
	private String meetid;
	private String invited;
	private String name;
	private String comment;
	private String ptime;
	private String personEmail;

	@Id
    @GenericGenerator(name = "generator", strategy = "uuid")
	@GeneratedValue(generator = "generator")// ×ÔÔö³¤
	public String getPersonid() {
		return personid;
	}

	public void setPersonid(String personid) {
		this.personid = personid;
	}

	public String getMeetid() {
		return meetid;
	}

	public void setMeetid(String meetid) {
		this.meetid = meetid;
	}

	public String getInvited() {
		return invited;
	}

	public void setInvited(String invited) {
		this.invited = invited;
	}

	public String getName() {
		return name;
	}

	public String getPtime() {
		return ptime;
	}

	public void setPtime(String ptime) {
		this.ptime = ptime;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPersonEmail() {
		return personEmail;
	}

	public void setPersonEmail(String personEmail) {
		this.personEmail = personEmail;
	}

	
	

}
