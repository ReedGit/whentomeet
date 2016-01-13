package com.giot.meeting.dao.impl;

import java.sql.Timestamp;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.giot.meeting.dao.UserDao;
import com.giot.meeting.entities.User;
import com.giot.meeting.utils.Iso8859_utf8;
import com.giot.meeting.utils.MD5;

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
	public boolean addUser(User user) {
		try {
			getSession().save(user);
			return true;
		} catch (RuntimeException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateUser(User user) {
		try {
			// 可以修改的字段nickname defaultDura password
			String nickname = user.getNickname();
			nickname = Iso8859_utf8.transfrom(nickname);

			int defaultDura = user.getDefaultDura();
			String password = user.getPassword();
			String username = user.getUsername();
			username = Iso8859_utf8.transfrom(username);

			StringBuilder sb = new StringBuilder("update User set ");

			Query query = null;
			if (null != nickname && !"".endsWith(nickname) && 0 != defaultDura) {
				// 修改昵称或者默认时长
				sb.append("nickname=?,defaultDura=? where username=?");
				query = getSession().createQuery(sb.toString())
						.setString(0, nickname).setInteger(1, defaultDura)
						.setString(2, username);
			} else if (null != password && !"".endsWith(password)) {
				// 修改密码
				sb.append("password=? where username=?");
				query = getSession().createQuery(sb.toString())
						.setString(0, MD5.compute(password))
						.setString(1, username);
			}
			int eu = query.executeUpdate();
			if (eu > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean findUser(String nameid) {
		try {
			String sql = "from User where username = ?";
			User u = (User) getSession().createQuery(sql).setString(0, nameid)
					.uniqueResult();
			if (u == null) {
				return false;
			} else
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
			getSession().createQuery(hql).setString(0, userid).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	@Override
	public User getUserById(String userid) {
		try {
			String hql = "from User where userid =?";
			User us = (User) getSession().createQuery(hql).setString(0, userid)
					.uniqueResult();
			return us;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public int getValidateStatus(String userid) {
		try {
			String hql = "select validate from User where userid=?";
			int a = (int) getSession().createQuery(hql).setString(0, userid)
					.uniqueResult();
			return a;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void createResetPasswordLink(String username, String secretKey,
			Timestamp outDate) {
		try {
			String hql = "update User set secretKey =?,outDate = ? where username = ?";
			getSession().createQuery(hql).setString(0, secretKey)
					.setTimestamp(1, outDate).setString(2, username)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	@Override
	public User getOneUser(String username) {
		try {
			String sql = "from User where username = ?";
			User u = (User) getSession().createQuery(sql)
					.setString(0, username).uniqueResult();
			return u;

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	@Override
	public void resetPassword(String username, String password) {
		try {
			String sql = "update User set password = ? where username = ?";
			getSession().createQuery(sql).setString(0, password)
					.setString(1, username).executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}

	@Override
	public User getUserByUsername(String username) {
		try {
			String hql = "from User where username =? and validate = 1";
			User u = (User) getSession().createQuery(hql)
					.setString(0, username).uniqueResult();
			return u;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User getUserByup(String username, String password) {
		try {
			String hql = "from User where username=? and password=?";
			return (User) getSession().createQuery(hql).setString(0, username)
					.setString(1, password).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User getUserByNickname(String nickname) {
		try {
			String hql = "from User where nickname =? and validate = 1";
			User u = (User) getSession().createQuery(hql)
					.setString(0, nickname).uniqueResult();
			return u;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
