package com.giot.meeting.controller;

import java.util.List;
import java.util.regex.Pattern;

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
	public boolean addTime(String times,String meetId){
		return timeService.addTime(times,meetId);
	}
	public static boolean isNumeric(String str){ 
	    Pattern pattern = Pattern.compile("[0-9]*"); 
	    return pattern.matcher(str).matches();    
	 } 
	
	
	@ResponseBody
	@RequestMapping("/findAllTime.do")
	public List<Time> findAllTime(String meetId){
		List<Time> timeList =  timeService.findAllTime(meetId);
		return timeList;
	}

}
