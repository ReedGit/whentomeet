package com.giot.meeting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.PersonDao;
import com.giot.meeting.entities.Person;
import com.giot.meeting.utils.CountTime;
import com.giot.meeting.utils.Invitee;

@Service
public class PersonService {

	@Autowired
	private PersonDao personDao;

	public void addPerson(Person person) {
		personDao.addPerson(person);
	}

	public void deletePerson(int meetid) {
		personDao.deletePerson(meetid);
	}

	public List<Invitee> findAllPerson(int meetid) {
		return personDao.findAllPerson(meetid);
	}

	public long getPersonCount(int meetid) {
		return personDao.getPersonCount(meetid);
	}
	
	public List<CountTime> getTimeCount(int meetid){
		return personDao.getTimeCount(meetid);
	}

}
