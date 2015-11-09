package com.giot.meeting.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.giot.meeting.entities.Meeting;
import com.giot.meeting.entities.User;
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
	public Meeting addMeeting(Meeting meeting,Map<String,Object> map,HttpSession session) {
		User u = (User)session.getAttribute("user1");
		if(u!=null){
			//�û���¼�����û�id,����Ϊ��
			meeting.setOrganiser(u.getUserid());
		}
		
		meeting.setCreateTime(new Date());
		
		return meetingService.addMeeting(meeting);
		//return meeting.getMeetid();
		/*map.put("duraValue", meeting.getDuration());
		map.put("meetId", meeting.getMeetid());
		return "timeTable";*/
	}

	@ResponseBody
	@RequestMapping("/findMeeting.do")
	public Meeting findMeeting(String meetid) {
		return meetingService.findMeeting(meetid);
	}

	@ResponseBody
	@RequestMapping("/findAllMeeting.do")
	public List<Meeting> findAllMeeting(String organiser,int start,int items) {
		return meetingService.findAllMeeting(organiser,start,items);
	}
	
	@ResponseBody
	@RequestMapping(value="/findAllMeetingForPhone.do",produces = {"application/json;charset=UTF-8"})
	public String findAllMeetingForPhone(String organiser,int start,int items){
		List<Meeting> list = meetingService.findAllMeeting(organiser, start, items);
		long count = meetingService.getMeetingCount(organiser);
		double pageCount = Math.ceil(count / 10.0);
		JSONArray jsonArray = new JSONArray();
		for(int i = 0;i<list.size();i++){
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("meetId", list.get(i).getMeetid());
			jsonObject.put("title", list.get(i).getTitle());
			jsonObject.put("createTime", list.get(i).getCreateTime());
			jsonObject.put("guys", list.get(i).getGuys());
			jsonObject.put("response", list.get(i).getResponse());
			jsonArray.put(jsonObject);
		}
		JSONObject result = new JSONObject();
		result.put("data", jsonArray);
		result.put("page", pageCount);
		return result.toString();
		
	}

	@ResponseBody
	@RequestMapping("/deleteMeeting.do")
	public void deleteMeeting(String meetid) {
		personService.deletePerson(meetid);
		timeService.deleteTime(meetid);
		meetingService.deleteMeeting(meetid);
	}
	
	@RequestMapping("/setConfirmTime.do")
	public void setConfirmTime(String meetId,String confirmTime,int confirmTimeOrder){
		meetingService.setConfirmTime(meetId, confirmTime,confirmTimeOrder);
	}

}
