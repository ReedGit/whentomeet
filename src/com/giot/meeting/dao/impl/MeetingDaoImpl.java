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

	@SuppressWarnings("finally")
	@Override
	public Meeting addMeeting(Meeting meeting) {
		
		Meeting m = new Meeting();
		try {
			getSession().save(meeting);
			m.setMeetid(meeting.getMeetid());
			m.setDuration(meeting.getDuration());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
			
		}finally{
			return m;
		}
	}
	
	@Override
	public void deleteMeeting(String meetid) {
		try {
			String sql = "delete from Meeting where meetid = :meetid";
			getSession().createQuery(sql).setString("meetid", meetid)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Meeting> findAllMeeting(String organiser, int start, int items) {
		try {
			String sql = "from Meeting where organiser = :organiser";
			return getSession().createQuery(sql)
					.setString("organiser", organiser).setFirstResult(start)
					.setMaxResults(items).list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public Meeting findMeeting(String meetid) {
		try {
			String sql = "from Meeting where meetid = :meetid";
			return (Meeting) getSession().createQuery(sql)
					.setString("meetid", meetid).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public long getMeetingCount(String organiser) {
		try {
			String sql = "select count(id) from Meeting where organiser = :organiser";
			return (long) getSession().createQuery(sql).setString("organiser", organiser).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void setConfirmTime(String meetId,String confirmTime ,int confirmTimeOrder) {
		try {
			String sql = "update Meeting set confirmTime =? , confirmTimeOrder =? where meetid =?";
			getSession().createQuery(sql).setString(0, confirmTime).setInteger(1, confirmTimeOrder).setString(2, meetId).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}

}
