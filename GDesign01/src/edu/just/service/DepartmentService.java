/*
 * 文件： DepartmentService.java
 * 创建日期 2016年2月3日
 *
 */
package edu.just.service;

import java.util.List;

import edu.just.entity.Department;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月3日 下午3:35:18)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface DepartmentService {

	List<Department> findAll();

	void save(Department model);

	void modify(Department model);

	Department findById(Integer id);

	void delete(Integer id);

	List<Department> findTopList();

	List<Department> findChildren(Integer parentId);

}

