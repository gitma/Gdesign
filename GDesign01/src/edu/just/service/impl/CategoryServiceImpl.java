/*
 * 文件： CategoryServiceImpl.java
 * 创建日期 2016年2月28日
 *
 */
package edu.just.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.just.common.PageBean;
import edu.just.dao.CategoryDao;
import edu.just.entity.Category;
import edu.just.service.CategoryService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月28日 下午7:33:32)
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
public class CategoryServiceImpl implements CategoryService{

	@Resource
	private CategoryDao categoryDao;
	@Resource
	private SessionFactory sessionFactory;
	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return categoryDao.findAll();
	}
	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		categoryDao.delete(id);
	}
	@Override
	public void save(Category model) {
		// TODO Auto-generated method stub
		categoryDao.save(model);
	}
	@Override
	public Category findById(Integer id) {
		// TODO Auto-generated method stub
		return (Category) categoryDao.findById(id);
	}
	@Override
	public void update(Category category) {
		// TODO Auto-generated method stub
		categoryDao.update(category);
	}
	@Override
	public PageBean findCategory(Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		//计算总页数
		Long recordCount = (Long) sessionFactory.getCurrentSession().createQuery(" Select Count(*) from Category ")
				.uniqueResult();
		
		List recordList = sessionFactory.getCurrentSession().createQuery("from Category category order by category.createdTime DESC ")
				.setFirstResult((pageNo-1) * pageSize)
				.setMaxResults(pageSize)
				.list();
		return new PageBean(pageNo, pageSize, recordCount.intValue(), recordList);
	}

}

