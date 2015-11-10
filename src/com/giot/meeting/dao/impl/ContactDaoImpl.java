package com.giot.meeting.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.giot.meeting.dao.ContactDao;
import com.giot.meeting.entities.Contact;

@Transactional
@Repository("contactDao")
public class ContactDaoImpl implements ContactDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addContact(Contact contact) {
		try {
			getSession().save(contact);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void deleteContact(String contactid) {
		try {
			String sql = "delete from Contact where contactid = :contactid";
			getSession().createQuery(sql).setString("contactid", contactid)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contact> findAllContactForpage(String userid, int start, int items) {
		try {
			String sql = "from Contact where userid = :userid";
			return getSession().createQuery(sql).setString("userid", userid)
					.setFirstResult(start).setMaxResults(items).list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public Contact findContact(String contactid) {
		try {
			String sql = "from Contact where contactid = :contactid";
			return (Contact) getSession().createQuery(sql)
					.setString("contactid", contactid).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public Contact findContactByEmail(String username) {
		try {
			String sql = "from Contact where username = :username";
			return (Contact) getSession().createQuery(sql)
					.setString("username", username).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contact> findAllContact(String userid) {
		try {
			String sql = "from Contact where userid = :userid order by contactid desc";
			return getSession().createQuery(sql)
					.setString("userid", userid).list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
