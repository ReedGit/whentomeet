package com.giot.meeting.dao;

import java.util.List;

import com.giot.meeting.entities.Meeting;

public interface MeetingDao {

	public String addMeeting(Meeting meeting);

	public void deleteMeeting(String meetid);

	public List<Meeting> findAllMeeting(String organiser,int start,int items);

	public Meeting findMeeting(String meetid);

}
