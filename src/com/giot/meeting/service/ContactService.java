package com.giot.meeting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.giot.meeting.dao.ContactDao;
import com.giot.meeting.entities.Contact;

@Service
public class ContactService {

	@Autowired
	private ContactDao contactDao;

	public void addContact(Contact contact) {
		contactDao.addContact(contact);
	}

	public void deleteContact(String contactid) {
		contactDao.deleteContact(contactid);
	}

	public List<Contact> findAllContact(String userid) {
		return contactDao.findAllContact(userid);
	}

	public Contact findContact(String contactid) {
		return contactDao.findContact(contactid);
	}

}
