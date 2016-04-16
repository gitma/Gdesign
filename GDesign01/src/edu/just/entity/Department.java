/*
 * 文件： Department.java
 * 创建日期 2016年2月3日
 *
 */
package edu.just.entity;

import java.util.Set;
 
 /**
 * 
 * @Description: 部门
 * @date： (2016年2月3日 下午2:21:52)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class Department {
	private Integer id;
	private String name;
	private String description;
	
	private Department parent;
	private Set<Department> children;
	
	private Set<User> users;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Department getParent() {
		return parent;
	}
	public void setParent(Department parent) {
		this.parent = parent;
	}
	public Set<Department> getChildren() {
		return children;
	}
	public void setChildren(Set<Department> children) {
		this.children = children;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public String toString(){
		return "Name:	" + name;
	}
	
}

