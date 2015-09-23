package com.giot.meeting.dao;

import java.util.List;

import com.giot.meeting.entities.Contact;

public interface ContactDao {

	public void addContact(Contact contact);

	public void deleteContact(int contactid);

	public List<Contact> findAllContact(int userid);

	public Contact findContact(int contactid);

}
