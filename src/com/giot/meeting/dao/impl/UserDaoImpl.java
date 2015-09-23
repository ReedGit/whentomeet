package com.giot.meeting.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.giot.meeting.dao.UserDao;
import com.giot.meeting.entities.User;

@Transactional
@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public User getUser(String nameid, String password) {
		try {
			String sql = "from User where nameid = :nameid and password = :password";
			return (User) getSession().createQuery(sql)
					.setString("nameid", nameid)
					.setString("password", password).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void addUser(User user) {
		try {
			getSession().save(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void updateUser(User user) {
		try {
			getSession().saveOrUpdate(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public User findUser(String nameid) {
		try {
			String sql = "from User where nameid = :nameid";
			return (User) getSession().createQuery(sql)
					.setString("nameid", nameid).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
