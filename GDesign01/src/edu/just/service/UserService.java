/*
 * 文件： UserService.java
 * 创建日期 2016年2月2日
 *
 */
package edu.just.service;

import java.util.List;

import edu.just.entity.User;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月2日 下午4:36:32)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface UserService {
	List<User> findAll();

	User findById(Integer id);

	void delete(Integer id);

	void modify(User user);

	void save(User user);

	User findByNameAndPwd(String username, String password);
}

