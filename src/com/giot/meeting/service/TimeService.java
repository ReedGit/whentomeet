package com.giot.meeting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.TimeDao;
import com.giot.meeting.entities.Time;
import com.giot.meeting.utils.Iso8859_utf8;

@Service
public class TimeService {

	@Autowired
	private TimeDao timeDao;

	public void addTime(String time,String meetId) {
		System.out.println("meetid    "+meetId);
		time = Iso8859_utf8.transfrom(time);
		System.out.println(time);
		
		//timeDao.addTime(time);
	}

	public void deleteTime(String meetid) {
		timeDao.deleteTime(meetid);
	}

	public List<Time> findAllTime(String meetid) {
		return timeDao.findAllTime(meetid);
	}

}
