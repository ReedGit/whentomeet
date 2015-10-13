package com.giot.meeting.dao;

import java.util.List;

import com.giot.meeting.entities.Person;
import com.giot.meeting.utils.CountTime;
import com.giot.meeting.utils.Invitee;

public interface PersonDao {

	public void addPerson(Person person);

	public void deletePerson(String meetid);

	public List<Invitee> findAllPerson(String meetid);

	public long getPersonCount(String meetid);

	public List<CountTime> getTimeCount(String meetid);

	public void deletePeronTime(String meetid, String invited);
	
	public void addPersonTime(String personid,String ptime,String name);
	
	public List<Person> getAllPersonTime(String meetId);

}
