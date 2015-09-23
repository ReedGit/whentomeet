package com.giot.meeting.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.giot.meeting.dao.MeetingDao;
import com.giot.meeting.entities.Meeting;

@Transactional
@Repository("meetingDao")
public class MeetingDaoImpl implements MeetingDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addMeeting(Meeting meeting) {
		try {
			getSession().save(meeting);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void deleteMeeting(int meetid) {
		try {
			String sql = "delete from Meeting where meetid = :meetid";
			getSession().createQuery(sql).setInteger("meetid", meetid)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Meeting> findAllMeeting(String organiser) {
		try {
			String sql = "from Meeting where organiser = :organiser";
			return getSession().createQuery(sql)
					.setString("organiser", organiser).list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public Meeting findMeeting(int meetid) {
		try {
			String sql = "from Meeting where meetid = :meetid";
			return (Meeting) getSession().createQuery(sql)
					.setInteger("meetid", meetid).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
