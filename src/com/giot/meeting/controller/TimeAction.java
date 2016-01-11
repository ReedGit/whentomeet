package com.giot.meeting.controller;

import java.util.List;
import java.util.regex.Pattern;

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
		
		timeService.addTime(times,meetId);
	/*	Gson gson = new Gson();
		List<Time> list = gson.fromJson(times, new TypeToken<List<Time>>(){}.getType());
		String timestr =null;
		Time time = null;
		for(Time t: list){
			if(!isNumeric(t.getStartTime())){
				//传过来的开始时间如果不是数字 就是小屏幕传过来的。小屏幕传过来直接是格式化好的时间，无需转换
				timestr = t.getDay()+","+t.getWeek()
						+"#"+t.getStartTime()+"-"+t.getEndTime();
			}else{
				//拼成这样的字符串 1月16日,星期六#01:00-02:00
				timestr = t.getDay()+","+t.getWeek()
						+"#"+transformTime(t.getStartTime())+"-"+transformTime(t.getEndTime());
			}
			
			time = new Time();
			time.setDate(timestr);
			time.setMeetid(meetId);
			timeService.addTime(time);
		}*/
		
		return "success";
		
	}
	public static boolean isNumeric(String str){ 
	    Pattern pattern = Pattern.compile("[0-9]*"); 
	    return pattern.matcher(str).matches();    
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
