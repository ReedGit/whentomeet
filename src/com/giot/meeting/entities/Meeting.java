package com.giot.meeting.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="MEETING")
public class Meeting {

	private String meetid;
	private String title;
	private String content;
	private String duration;
	private String visible;
	private String organiser;//该用户登陆就存该用户的id,否则为空
	private String organiser_mail;//次字段为组织者的邮箱，
	private String remark;
	private String location;
	private Date createTime;
	private int guys;//受邀人数
	private int response;
	private String confirmTime;//最终确认的时间
	private int confirmTimeOrder;//在网页中，最终时间的位置
	
	
	@Id
    @GenericGenerator(name = "generator", strategy = "uuid")
	@GeneratedValue(generator = "generator")// 自增长
	public String getMeetid() {
		return meetid;
	}

	public void setMeetid(String meetid) {
		this.meetid = meetid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

	public String getOrganiser() {
		return organiser;
	}

	public void setOrganiser(String organiser) {
		this.organiser = organiser;
	}

	
	
	public String getOrganiser_mail() {
		return organiser_mail;
	}

	public void setOrganiser_mail(String organiser_mail) {
		this.organiser_mail = organiser_mail;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	public Date getCreateTime() {
		return createTime;
	}
	
	
	public int getGuys() {
		return guys;
	}

	public void setGuys(int guys) {
		this.guys = guys;
	}

	public int getResponse() {
		return response;
	}

	public void setResponse(int response) {
		this.response = response;
	}

	
	public String getConfirmTime() {
		return confirmTime;
	}
	public void setConfirmTime(String confirmTime) {
		this.confirmTime = confirmTime;
	}
	
	public int getConfirmTimeOrder() {
		return confirmTimeOrder;
	}
	public void setConfirmTimeOrder(int confirmTimeOrder) {
		this.confirmTimeOrder = confirmTimeOrder;
	}
	@Override
	public String toString() {
		return "Meeting [meetid=" + meetid + ", title=" + title + ", content="
				+ content + ", duration=" + duration + ", visible=" + visible
				+ ", organiser=" + organiser + ", remark=" + remark
				+ ", location=" + location + "]";
	}

}
