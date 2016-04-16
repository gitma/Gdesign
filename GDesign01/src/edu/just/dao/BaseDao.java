/*
 * 文件： BaseDao.java
 * 创建日期 2016年1月29日
 *
 */
package edu.just.dao;

import java.util.List;

 /**
 * 
 * @Description: TODO
 * @date： (2016年1月29日 下午5:01:27)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface BaseDao<T> {
	
	/*保存*/
	public void save(T t);
	/*删除*/
	public void delete(Integer id);
	/*修改*/
	public void update(T t);
	/*查找 根据id查找*/
	public T findById(Integer id);
	/*根据一组id查找*/
	public List<T> findByIds(Integer[] ids);
	/*查询所有*/
	public List<T> findAll();
}

