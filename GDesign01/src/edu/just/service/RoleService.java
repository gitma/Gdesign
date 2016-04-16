/*
 * 文件： RoleService.java
 * 创建日期 2016年2月5日
 *
 */
package edu.just.service;

import java.util.List;

import edu.just.entity.Role;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月5日 下午3:22:24)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface RoleService {

	List<Role> findAll();

	List<Role> findByIds(Integer[] roleIds);

	void save(Role model);

	void modify(Role model);

	Role findById(Integer id);

}

