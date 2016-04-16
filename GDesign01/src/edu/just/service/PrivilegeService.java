/*
 * 文件： PrivilegeService.java
 * 创建日期 2016年2月14日
 *
 */
package edu.just.service;

import java.util.List;

import edu.just.entity.Privilege;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月14日 下午5:37:32)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface PrivilegeService {

	List<Privilege> findAll();

	List<Privilege> findByIds(Integer[] privilegeIds);

	List<Privilege> findTopList();

}

