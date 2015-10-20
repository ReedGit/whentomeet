package com.giot.meeting.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.giot.meeting.entities.Meeting;
import com.giot.meeting.service.MeetingService;
import com.giot.meeting.service.PersonService;
import com.giot.meeting.service.TimeService;

@Controller
public class MeetingAction {

	@Autowired
	private MeetingService meetingService;
	@Autowired
	private TimeService timeService;
	@Autowired
	private PersonService personService;

	//@ResponseBody
	@RequestMapping("/addMeeting.do")
	public String addMeeting(Meeting meeting,Map<String,Object> map) {
		meetingService.addMeeting(meeting);
		//return meeting.getMeetid();
		map.put("duraValue", meeting.getDuration());
		map.put("meetId", meeting.getMeetid());
		return "timeTable";
	}

	@ResponseBody
	@RequestMapping("/findMeeting.do")
	public Meeting findMeeting(String meetid) {
		return meetingService.findMeeting(meetid);
	}

	@ResponseBody
	@RequestMapping("/findAllMeeting.do")
	public List<Meeting> findAllMeeting(String organiser) {
		return meetingService.findAllMeeting(organiser);
	}

	@ResponseBody
	@RequestMapping("/deleteMeeting.do")
	public void deleteMeeting(String meetid) {
		personService.deletePerson(meetid);
		timeService.deleteTime(meetid);
		meetingService.deleteMeeting(meetid);
	}

}