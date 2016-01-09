package com.giot.meeting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.MeetingDao;
import com.giot.meeting.entities.Meeting;
import com.giot.meeting.utils.Iso8859_utf8;

@Service
public class MeetingService {

	@Autowired
	private MeetingDao meetingDao;

	public Meeting addMeeting(Meeting meeting) {
		String content =  Iso8859_utf8.transfrom(meeting.getContent());
		String location = Iso8859_utf8.transfrom(meeting.getLocation());
		String title =    Iso8859_utf8.transfrom(meeting.getTitle());
		System.out.println(content+" "+location+" "+title);
		meeting.setContent(content);
		meeting.setLocation(location);
		meeting.setTitle(title);
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
	
	public void setConfirmTime(String meetId,String confirmTime ,int confirmTimeOrder){
		meetingDao.setConfirmTime(meetId, confirmTime,confirmTimeOrder);
	}

}
