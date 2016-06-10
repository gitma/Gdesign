/*
 * 文件： SignServiceImpl.java
 * 创建日期 2016年4月10日
 *
 */
package edu.just.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.just.dao.SignDao;
import edu.just.entity.Sign;
import edu.just.entity.User;
import edu.just.service.SignService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月10日 下午1:42:38)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Service
@Transactional
public class SignServiceImpl implements SignService{

	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private SignDao<Sign> signDao;
	
	@Override
	public void sign(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().createQuery("Insert into Sign sign where user = ?")
			.setParameter(0, user)
			.uniqueResult();
		
	}
	@Override
	public void save(Sign sign) {
		// TODO Auto-generated method stub
		signDao.save(sign);
	}
	@Override
	public void update(Sign sign) {
		// TODO Auto-generated method stub
		signDao.update(sign);
	}
	@Override
	public List<Sign> findByUserAndDate(User user, int year, int month) {
		// TODO Auto-generated method stub
		return (List<Sign>) sessionFactory.getCurrentSession().createQuery("From Sign s where s.user=? and s.year=? and s.month=? order by id desc")
				.setParameter(0, user)
				.setParameter(1, year)
				.setParameter(2, month)
				.list();
	}
	@Override
	public List<Sign> findSignHistoryByUserAndDate(User user, Date startTime,
			Date endTime) {
		// TODO Auto-generated method stub
		return (List<Sign>) sessionFactory.getCurrentSession().createQuery("From Sign s where  s.user=? and s.lastSignDate>=? and s.lastSignDate<=? order by id asc")
				.setParameter(0, user)
				.setParameter(1, startTime)
				.setParameter(2, endTime)
				.list();
							
	}
	@Override
	public List<Sign> findSignHistoryByUserAndDate(User user, String startTime,
			String endTime) {
		// TODO Auto-generated method stub
		return null;
	}

}

