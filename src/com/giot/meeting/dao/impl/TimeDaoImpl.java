package com.giot.meeting.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.giot.meeting.dao.TimeDao;
import com.giot.meeting.entities.Time;

@Transactional
@Repository("timeDao")
public class TimeDaoImpl implements TimeDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addTime(Time time) {
		try {
			getSession().save(time);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void deleteTime(String meetid) {
		try {
			String sql = "delete from Time where meetid = :meetid";
			getSession().createQuery(sql).setString("meetid", meetid)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Time> findAllTime(String meetid) {
		try {
			String sql = "from Time where meetid = :meetid";
			return getSession().createQuery(sql).setString("meetid", meetid)
					.list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
