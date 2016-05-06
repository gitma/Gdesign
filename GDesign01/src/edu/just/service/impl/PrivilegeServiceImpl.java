/*
 * 文件： PrivilegeServiceImpl.java
 * 创建日期 2016年2月14日
 *
 */
package edu.just.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.just.dao.PrivilegeDao;
import edu.just.entity.Privilege;
import edu.just.service.PrivilegeService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月14日 下午5:37:50)
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
public class PrivilegeServiceImpl implements PrivilegeService{

	
	@Resource
	private PrivilegeDao<Privilege> privilegeDao;

	@Resource
	private SessionFactory sessionFactory;
	@Override
	public List<Privilege> findAll() {
		// TODO Auto-generated method stub
		return privilegeDao.findAll();
	}

	@Override
	public List<Privilege> findByIds(Integer[] privilegeIds) {
		// TODO Auto-generated method stub
		return privilegeDao.findByIds(privilegeIds);
	}

	@Override
	public List<Privilege> findTopList() {
		// TODO Auto-generated method stub
		return (List<Privilege>) sessionFactory.getCurrentSession().createQuery("from Privilege p where p.parent is null order by p.id ASC").list();
	}
	
}

