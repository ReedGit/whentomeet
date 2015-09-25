package com.giot.meeting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.giot.meeting.entities.Person;
import com.giot.meeting.service.PersonService;
import com.giot.meeting.utils.CountTime;
import com.giot.meeting.utils.Invitee;

@Controller
public class PersonAction {

	@Autowired
	private PersonService personService;

	@ResponseBody
	@RequestMapping("/addPerson.do")
	public void addPerson(Invitee invitee) {
		Person person = new Person();
		person.setMeetid(invitee.getMeetid());
		person.setInvited(invitee.getInvited());
		person.setName(invitee.getName());
		person.setComment(invitee.getComment());
		String date = invitee.getDate();
		String[] dateArray = date.split(";");
		for (int i = 0; i < dateArray.length; i++) {
			person.setDate(dateArray[i]);
			personService.addPerson(person);
		}
	}

	@ResponseBody
	@RequestMapping("/findAllPerson.do")
	public List<Invitee> findAllPerson(String meetid) {
		return personService.findAllPerson(meetid);
	}

	@ResponseBody
	@RequestMapping("/getPersonCount.do")
	public long getPersonCount(String meetid) {
		return personService.getPersonCount(meetid);
	}

	@ResponseBody
	@RequestMapping("/getTimeCount.do")
	public List<CountTime> getTimeCount(String meetid) {
		return personService.getTimeCount(meetid);
	}

	@ResponseBody
	@RequestMapping("updatePersonTime.do")
	public void updatePersonTime(Invitee invitee) {
		personService.deletePersonTime(invitee.getMeetid(), invitee.getInvited());
		addPerson(invitee);
	}

}
