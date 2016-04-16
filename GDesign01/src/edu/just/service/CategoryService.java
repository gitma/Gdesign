/*
 * 文件： CategoryService.java
 * 创建日期 2016年2月28日
 *
 */
package edu.just.service;

import java.util.List;

import edu.just.common.PageBean;
import edu.just.entity.Category;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月28日 下午7:33:13)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface CategoryService {

	List<Category> findAll();

	void delete(Integer id);

	void save(Category model);

	Category findById(Integer id);

	void update(Category category);

	PageBean findCategory(Integer pageNo, Integer pageSize);

}

