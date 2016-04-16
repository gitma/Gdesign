/*
 * 文件： DepartmentServiceImpl.java
 * 创建日期 2016年2月3日
 *
 */
package edu.just.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.just.dao.DepartmentDao;
import edu.just.entity.Department;
import edu.just.service.DepartmentService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月3日 下午3:35:33)
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
@SuppressWarnings("unchecked")
public class DepartmentServiceImpl implements DepartmentService{

	@Resource
	private DepartmentDao<Department> departmentDao;
	@Resource
	private SessionFactory sessionFactory;
	@Override
	public List<Department> findAll() {
		// TODO Auto-generated method stub
		return departmentDao.findAll();
	}
	@Override
	public void save(Department model) {
		// TODO Auto-generated method stub
		departmentDao.save(model);
	}
	@Override
	public void modify(Department model) {
		// TODO Auto-generated method stub
		departmentDao.update(model);
	}
	@Override
	public Department findById(Integer id) {
		// TODO Auto-generated method stub
		return (Department) departmentDao.findById(id);
	}
	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		departmentDao.delete(id);
	}
	
	@Override
	public List<Department> findTopList() {
		// TODO Auto-generated method stub
		return (List<Department>) sessionFactory.getCurrentSession().createQuery(" from Department d where d.parent is null").list();
	}
	@Override
	public List<Department> findChildren(Integer parentId) {
		// TODO Auto-generated method stub
		return (List<Department>) sessionFactory.getCurrentSession().createQuery(" from Department d where d.parent.id=?")
				.setParameter(0, parentId).list();
	}

}

