/*
 * 文件： Privilege.java
 * 创建日期 2016年2月6日
 *
 */
package edu.just.entity;

import java.util.Set;
 
 /**
 * 
 * @Description: TODO(权限)
 * @date： (2016年2月6日 上午10:44:52)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class Privilege {
	private Integer id;
	private String name;
	private String url;
	
	private Privilege parent;//上级权限
	private Set<Privilege> children;//下级权限
	private Set<Role> roles;
	
	public Privilege(){}
	public Privilege(String name, String url){
		this.name=name;
		this.url=url;
	}
	public Privilege(String name, String url, Privilege parent){
		this.name=name;
		this.url=url;
		this.parent=parent;
	}
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Privilege getParent() {
		return parent;
	}
	public void setParent(Privilege parent) {
		this.parent = parent;
	}
	public Set<Privilege> getChildren() {
		return children;
	}
	public void setChildren(Set<Privilege> children) {
		this.children = children;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	public String toString(){
		return "Name:	" + name;
	}
	
	
}

