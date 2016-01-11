package com.giot.meeting.dao;

import java.util.List;

import com.giot.meeting.entities.Time;

public interface TimeDao {

	public boolean addTime(Time time);

	public void deleteTime(String meetid);

	public List<Time> findAllTime(String meetid);

}
