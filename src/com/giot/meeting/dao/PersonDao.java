package com.giot.meeting.dao;


import java.util.List;

import com.giot.meeting.entities.Person;
import com.giot.meeting.utils.CountTime;
import com.giot.meeting.utils.Invitee;

public interface PersonDao {

	public void addPerson(Person person);

	public void deletePerson(int meetid);

	public List<Invitee> findAllPerson(int meetid);

	public long getPersonCount(int meetid);
	
	public List<CountTime> getTimeCount(int meetid);
	
}
