package com.giot.meeting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.MeetingDao;
import com.giot.meeting.entities.Meeting;

@Service
public class MeetingService {

	@Autowired
	private MeetingDao meetingDao;

	public Meeting addMeeting(Meeting meeting) {
		return meetingDao.addMeeting(meeting);
	}

	public void deleteMeeting(String meetid) {
		meetingDao.deleteMeeting(meetid);
	}

	public List<Meeting> findAllMeeting(String organiser,int start,int items) {
		return meetingDao.findAllMeeting(organiser,start,items);
	}

	public Meeting findMeeting(String meetid) {
		return meetingDao.findMeeting(meetid);
	}
	
	public long getMeetingCount(String organiser){
		return meetingDao.getMeetingCount(organiser);
	}

}
