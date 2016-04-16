/*
 * 文件： UserDaoImpl.java
 * 创建日期 2016年1月29日
 *
 */
package edu.just.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import edu.just.dao.UserDao;
import edu.just.entity.User;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年1月29日 下午5:26:37)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Repository
@SuppressWarnings("unchecked")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao<User> {

	
	@Override
	public List<User> findByNames(String[] names) {
		// TODO Auto-generated method stub
		return (List<User>) getSession().createQuery(" from " + entityClass.getSimpleName() + " where name in (:names)").
				setParameterList("names", names).list();
	}

}

