package com.giot.meeting.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="USER")
public class User {

	private String userid;
	private String nameid;
	private String username;
	private String password;
	private String image;
	
	private int validate;

	@Id
    @GenericGenerator(name = "generator", strategy = "uuid")
	@GeneratedValue(generator = "generator")// ������
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNameid() {
		return nameid;
	}

	public void setNameid(String nameid) {
		this.nameid = nameid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	

	public int getValidate() {
		return validate;
	}

	public void setValidate(int validate) {
		this.validate = validate;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + "]";
	}

}