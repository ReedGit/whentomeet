package com.giot.meeting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.TimeDao;
import com.giot.meeting.entities.Time;

@Service
public class TimeService {

	@Autowired
	private TimeDao timeDao;

	public void addTime(Time time) {
		timeDao.addTime(time);
	}

	public void deleteTime(String meetid) {
		timeDao.deleteTime(meetid);
	}

	public List<Time> findAllTime(String meetid) {
		return timeDao.findAllTime(meetid);
	}

}
