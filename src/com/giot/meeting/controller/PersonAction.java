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
	public void addPerson(Person person) {
		personService.addPerson(person);
	}

	@ResponseBody
	@RequestMapping("/findAllPerson.do")
	public List<Invitee> findAllPerson(int meetid) {
		return personService.findAllPerson(meetid);
	}

	@ResponseBody
	@RequestMapping("/getPersonCount.do")
	public long getPersonCount(int meetid) {
		return personService.getPersonCount(meetid);
	}

	@ResponseBody
	@RequestMapping("/getTimeCount.do")
	public List<CountTime> getTimeCount(int meetid) {
		return personService.getTimeCount(meetid);
	}

}
