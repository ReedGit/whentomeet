package com.giot.meeting.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.giot.meeting.dao.PersonDao;
import com.giot.meeting.entities.Person;
import com.giot.meeting.utils.CountTime;
import com.giot.meeting.utils.Invitee;

@Transactional
@Repository("personDao")
public class PersonDaoImpl implements PersonDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addPerson(Person person) {
		try {
			getSession().save(person);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void deletePerson(String meetid) {
		try {
			String sql = "delete from Person where meetid = :meetid";
			getSession().createQuery(sql).setString("meetid", meetid)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Invitee> findAllPerson(String meetid) {
		try {
			String sql = "select meetid,invited,name,comment,group_concat(date separator ';') as date from Person where meetid = :meetid";
			return getSession().createSQLQuery(sql).setString("meetid", meetid)
					.list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public long getPersonCount(String meetid) {
		try {
			String sql = "select count(distinct invited) from Person where meetid = :meetid";
			return (Long) getSession().createQuery(sql)
					.setString("meetid", meetid).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CountTime> getTimeCount(String meetid) {
		try {
			String sql = "select * from (select date,count(date) as count from Person  where meetid = :meetid group by date) a where count = (select max(count) from (select count(date) as count from Person where meetid = :meetid group by date) b)";
			return getSession().createSQLQuery(sql).setString("meetid", meetid)
					.list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void deletePeronTime(String meetid, String invited) {
		try {
			String sql = "delete from Person where meetid = :meetid and invited = :invited";
			getSession().createQuery(sql).setString("meetid", meetid)
					.setString("invited", invited).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void addPersonTime(String personid,String ptime,String name) {
		try {
			String sql = "update Person set ptime=? ,name=? where personid=?";
			getSession().createQuery(sql).setString(0, ptime).setString(1, name)
					.setString(2, personid).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}

	@Override
	public List<Person> getAllPersonTime(String meetId){
		try {
			String sql = "from Person where meetid = ?";
			return getSession().createQuery(sql).setString(0, meetId).list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> getMeetingAttend(String personEmail,int start,int items) {
		try {
			String sql = "from Person where personEmail = ?";
			return getSession().createQuery(sql).setString(0, personEmail).setFirstResult(start).setMaxResults(items).list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
