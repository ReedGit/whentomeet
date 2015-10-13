package com.giot.meeting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.giot.meeting.entities.Time;
import com.giot.meeting.service.TimeService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class TimeAction {
	
	@Autowired
	private TimeService timeService;
	@ResponseBody
	@RequestMapping("/addTime.do")
	public String addTime(String times,String meetId){
		
		Gson gson = new Gson();
		List<Time> list = gson.fromJson(times, new TypeToken<List<Time>>(){}.getType());
		
		for(Time t: list){
			String timestr = t.getDay()+","+t.getWeek()
					+"#"+transformTime(t.getStartTime())+"-"+transformTime(t.getEndTime());
			Time time = new Time();
			time.setDate(timestr);
			time.setMeetid(meetId);
			timeService.addTime(time);
			
		}
		
		return "success";
		
	}
	
	
	public static String transformTime(String s){
		int a = Integer.parseInt(s);
		String m = (a*15)%60+"";
		String h = (a*15)/60+"";
		
		if(Integer.parseInt(h)<10){
			h = "0"+h;
		}
		if(Integer.parseInt(m)<10){
			m = "0"+m;
		}
		if(h.endsWith("24")){
			h = "00";
		}
		return h+":"+m;
	}
	
	@ResponseBody
	@RequestMapping("/findAllTime.do")
	public List<Time> findAllTime(String meetId){
		List<Time> timeList =  timeService.findAllTime(meetId);
		return timeList;
	}

}
