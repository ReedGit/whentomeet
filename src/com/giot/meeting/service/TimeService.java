package com.giot.meeting.service;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.TimeDao;
import com.giot.meeting.entities.Time;
import com.giot.meeting.utils.Iso8859_utf8;

@Service
public class TimeService {

	@Autowired
	private TimeDao timeDao;
	
	public static String transformTime(int a){
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
	
	public boolean addTime(String time,String meetId) {
		time = Iso8859_utf8.transfrom(time);
		String timeString = "";
		Time timeObj = null;
		boolean flag = false;
		try {
			JSONArray array = new JSONArray(time);
			int length = array.length();
			for(int i=0;i<length;i++){
				Object obj = array.get(i);
				if (obj instanceof JSONObject) {
					//大屏幕传过来
					JSONObject jobj = (JSONObject) obj;
					String day = jobj.getString("day");
					String week = jobj.getString("week");
					int startTime = jobj.getInt("startTime");
					int endTime = jobj.getInt("endTime");
					
					String stime = transformTime(startTime);
					String etime = transformTime(endTime);
					StringBuilder dateStr = new StringBuilder(day);
					dateStr.append(",");
					dateStr.append(week);
					dateStr.append("#");
					dateStr.append(stime);
					dateStr.append("-");
					dateStr.append(etime);
					timeString = dateStr.toString();
					
				}else if(obj instanceof String){
					//小屏幕传过来
					timeString = (String) obj;
				}
				timeObj = new Time();
				timeObj.setDate(timeString);
				timeObj.setMeetid(meetId);
				flag = timeDao.addTime(timeObj);	
			}
			
			
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return flag;
		
		//timeDao.addTime(time);
	}

	public void deleteTime(String meetid) {
		timeDao.deleteTime(meetid);
	}

	public List<Time> findAllTime(String meetid) {
		return timeDao.findAllTime(meetid);
	}

}
