/*
 * 文件： UserDao.java
 * 创建日期 2016年1月29日
 *
 */
package edu.just.dao;

import java.util.List;

import edu.just.entity.User;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年1月29日 下午5:21:47)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface UserDao<T> extends BaseDao<T>{

	/*根据姓名查找用户*/
	public List<User> findByNames(String[] names);
}

