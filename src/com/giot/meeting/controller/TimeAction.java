package com.giot.meeting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.giot.meeting.entities.Time;
import com.giot.meeting.service.TimeService;

@Controller
public class TimeAction {
	
	@Autowired
	private TimeService timeService;
	
	@ResponseBody
	@RequestMapping("/addTime.do")
	public void addTime(Time time){
		timeService.addTime(time);
	}
	
	@ResponseBody
	@RequestMapping("/findAllTime.do")
	public List<Time> findAllTime(int meetid){
		return timeService.findAllTime(meetid);
	}

}
