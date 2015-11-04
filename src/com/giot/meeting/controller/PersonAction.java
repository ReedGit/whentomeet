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
	public void addPerson(String personId,String ptime,String name) {
			personService.addPersonTime(personId, ptime,name);
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

	/*@ResponseBody
	@RequestMapping("updatePersonTime.do")
	public void updatePersonTime(Invitee invitee) {
		personService.deletePersonTime(invitee.getMeetid(), invitee.getInvited());
		addPerson(invitee);
	}
*/
	@ResponseBody
	@RequestMapping("/getAllPersonTime.do")
	public List<Person> getAllPersonTime(String meetid) {
		
		List<Person> personTime = personService.getAllPersonTime(meetid);
		return personTime;
	}
	
	@ResponseBody
	@RequestMapping("/getMeetingAttend.do")
	public List<Person> getMeetingAttend(String personEmail,int start,int items) {
		
		return personService.getMeetingAttend(personEmail, start,items);
	}
}
