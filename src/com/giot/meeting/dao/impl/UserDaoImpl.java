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
			String sql = "from User where username = :nameid and password = :password";
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
		} catch (RuntimeException  e) {
			e.printStackTrace();
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
	public boolean findUser(String nameid) {
		try {
			String sql = "from User where username = ?";
			User u =  (User) getSession().createQuery(sql)
					.setString(0, nameid).uniqueResult();
			if(u==null){
				return false;
			}else
				return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void updateValidateStatus(String userid) {
		try {
			String hql = "update User set validate=1 where userid=?";
			 getSession().createQuery(hql)
					.setString(0, userid).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}

	@Override
	public User getUserById(String userid) {
		try {
			String hql = "from User where userid =?";
			 User us = (User) getSession().createQuery(hql)
					.setString(0, userid).uniqueResult();
			 return us;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
