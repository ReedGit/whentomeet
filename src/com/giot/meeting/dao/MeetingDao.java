package com.giot.meeting.dao;

import java.util.List;

import com.giot.meeting.entities.Meeting;

public interface MeetingDao {

	public void addMeeting(Meeting meeting);

	public void deleteMeeting(int meetid);

	public List<Meeting> findAllMeeting(String organiser);

	public Meeting findMeeting(int meetid);

}
