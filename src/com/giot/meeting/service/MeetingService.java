package com.giot.meeting.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.MeetingDao;
import com.giot.meeting.dao.PersonDao;
import com.giot.meeting.entities.Meeting;
import com.giot.meeting.entities.Person;
import com.giot.meeting.utils.Iso8859_utf8;

@Service
public class MeetingService {

	@Autowired
	private MeetingDao meetingDao;
	@Autowired
	private PersonDao pdao;
	
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

	
	public String getAttendMeMeeting(String email,int page,int items){
		//查询邀请我的会议，用该用户注册的时候的email进行查询，
		int start = (page-1)*items;
		List<Person> person = pdao.getMeetingAttend(email, start, items);
		JSONArray array = new JSONArray();
		JSONObject obj = null;
		Meeting findMeeting = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		for(Person p: person){
			String meetId = p.getMeetid();
			findMeeting = meetingDao.findMeeting(meetId);
			obj = new JSONObject();
			
			obj.put("meetId", findMeeting.getMeetid());
			obj.put("personId", p.getPersonid());
			obj.put("name", findMeeting.getTitle());
			String dateTime  =format.format(findMeeting.getCreateTime());
			obj.put("datetime", dateTime);
			obj.put("response", findMeeting.getResponse()+"/"+findMeeting.getGuys());
			array.put(obj);
		}
		
		return array.toString();
	}
	
	public int getMeetingAttendPages(String personEmail,int items){
		double count = pdao.getMeetingAttendCount(personEmail);
		int pages = (int) Math.ceil(count/items);
		return pages;
		
	}
	
}
