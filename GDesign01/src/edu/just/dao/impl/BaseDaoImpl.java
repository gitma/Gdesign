/*
 * 文件： BaseDaoImpl.java
 * 创建日期 2016年1月29日
 *
 */
package edu.just.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import edu.just.dao.BaseDao;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年1月29日 下午5:14:39)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> implements BaseDao<T>{

	private Log log = LogFactory.getLog(this.getClass());
	protected Class<T> entityClass;
	public BaseDaoImpl(){
		/*使用反射技术得到T的真实类型*/
		entityClass = (Class<T>) ((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		System.out.println("entityClass------》" + entityClass);
	}
	
	@Resource
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void save(T t) {
		// TODO Auto-generated method stub
		getSession().save(t);
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		Object obj = findById(id);
		if(obj!=null){
			getSession().delete(obj);
		}
		
	}

	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		getSession().update(t);
	}

	@Override
	public T findById(Integer id) {
		// TODO Auto-generated method stub
		if(id == null){
			return null;
		}else return (T) getSession().get(entityClass, id);
	}

	@Override
	public List<T> findByIds(Integer[] ids) {
		// TODO Auto-generated method stub
		return (List<T>) getSession().createQuery("from " + entityClass.getSimpleName() + " where id in (:ids)").setParameterList("ids", ids).list();
	}
	
	@Override
	public List<T> findAll() {
		// TODO Auto-generated method stub
		return (List<T>)getSession().createQuery("from " + entityClass.getSimpleName()).list();
	}
	public static void main(String[] args){
	}
	
	
	
}

