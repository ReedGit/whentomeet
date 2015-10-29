package com.giot.meeting.dao;

import java.util.List;

import com.giot.meeting.entities.Contact;

public interface ContactDao {

	public void addContact(Contact contact);

	public void deleteContact(String contactid);

	public List<Contact> findAllContactForpage(String userid, int start, int items);

	public List<Contact> findAllContact(String userid);
	
	public Contact findContact(String contactid);
	
	public Contact findContactByEmail(String username);

}
