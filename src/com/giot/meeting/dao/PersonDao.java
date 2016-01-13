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
	
	public List<Person> getMeetingAttend(String personEmail,int start,int items);
	//和上面分页查询配套
	public long getMeetingAttendCount(String personEmail);
	
	public Person getPerson(String meetId,String personName);

}
