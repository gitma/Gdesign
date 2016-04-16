/*
 * 文件： UserServiceImpl.java
 * 创建日期 2016年2月2日
 *
 */
package edu.just.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.just.dao.UserDao;
import edu.just.entity.User;
import edu.just.service.UserService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月2日 下午4:36:57)
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
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserDao<User> userDao;
	@Resource 
	private SessionFactory sessionFactory;
	
	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userDao.findAll();
	}

	@Override
	public User findById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findById(id);
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		userDao.delete(id);
	}

	@Override
	public void modify(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		userDao.save(user);
	}

	@Override
	public User findByNameAndPwd(String username, String password) {
		// TODO Auto-generated method stub
		return (User) sessionFactory.getCurrentSession().createQuery("from User u where u.username=? and u.password=?")
					.setParameter(0, username).setParameter(1, password).uniqueResult();
	}


}

