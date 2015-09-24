package com.giot.meeting.entities;

public class Person {
	
	private String personid;
	private String meetid;
	private String invited;
	private String name;
	private String comment;
	private String date;

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

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	

}
