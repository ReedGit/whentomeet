package com.giot.meeting.dao;

import java.util.List;

import com.giot.meeting.entities.Meeting;

public interface MeetingDao {

	public Meeting addMeeting(Meeting meeting);

	public void deleteMeeting(String meetid);

	public List<Meeting> findAllMeeting(String organiser,int start,int items);

	public Meeting findMeeting(String meetid);

	public long getMeetingCount(String organiser);
	
	public void setConfirmTime(String meetId,String confirmTime,int confirmTimeOrder);
}
