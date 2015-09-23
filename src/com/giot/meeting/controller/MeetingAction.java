package com.giot.meeting.controller;

import java.util.List;

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

	@ResponseBody
	@RequestMapping("/addMeeting.do")
	public void addMeeting(Meeting meeting) {
		meetingService.addMeeting(meeting);
	}

	@ResponseBody
	@RequestMapping("/findMeeting.do")
	public Meeting findMeeting(int meetid) {
		return meetingService.findMeeting(meetid);
	}

	@ResponseBody
	@RequestMapping("/findAllMeeting.do")
	public List<Meeting> findAllMeeting(String organiser) {
		return meetingService.findAllMeeting(organiser);
	}

	@ResponseBody
	@RequestMapping("/deleteMeeting.do")
	public void deleteMeeting(int meetid) {
		personService.deletePerson(meetid);
		timeService.deleteTime(meetid);
		meetingService.deleteMeeting(meetid);
	}

}
