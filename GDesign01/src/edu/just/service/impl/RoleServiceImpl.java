/*
 * 文件： RoleServiceImpl.java
 * 创建日期 2016年2月5日
 *
 */
package edu.just.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.just.dao.RoleDao;
import edu.just.entity.Role;
import edu.just.service.RoleService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月5日 下午3:22:58)
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
public class RoleServiceImpl implements RoleService{

	@Resource
	private RoleDao<Role> roleDao;

	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		return roleDao.findAll();
	}

	@Override
	public List<Role> findByIds(Integer[] roleIds) {
		// TODO Auto-generated method stub
		return roleDao.findByIds(roleIds);
	}

	@Override
	public void save(Role model) {
		// TODO Auto-generated method stub
		roleDao.save(model);
	}

	@Override
	public void modify(Role model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Role findById(Integer id) {
		// TODO Auto-generated method stub
		return roleDao.findById(id);
	}
}

