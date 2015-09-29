package com.giot.meeting.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.giot.meeting.entities.Contact;
import com.giot.meeting.service.ContactService;

@Controller
public class ContactAction {

	@Autowired
	private ContactService contactService;

	@ResponseBody
	@RequestMapping("/addContact.do")
	public String addContact(Contact contact) {
		contactService.addContact(contact);
		return contact.getContactid();
	}

	@ResponseBody
	@RequestMapping("/deleteContact.do")
	public void deleteContact(String contactid) {
		contactService.deleteContact(contactid);
	}

	@ResponseBody
	@RequestMapping("/findContact.do")
	public Contact findContact(String contactid) {
		return contactService.findContact(contactid);
	}

	@ResponseBody
	@RequestMapping("/findAllContact.do")
	public List<Contact> findAllContact(String userid) {
		return contactService.findAllContact(userid);
	}

}
