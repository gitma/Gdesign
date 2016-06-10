/*
 * 文件： User.java
 * 创建日期 2016年1月26日
 *
 */
package edu.just.entity;

import java.util.Set;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年1月26日 下午6:33:32)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class User {
	private Integer id;
	private String username;
	private String password;
	private String realname;
	private String gender;
	private String telephone;
	private String email;
	private String description;
	
	private Department department;
	private Set<Role> roles;
	private String age;
	
	public User(){}
	
	public User(String name, String age){
		this.username = name;
		this.age = age;
	}

	
	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getId() {
		return id;
	}


	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	public String toString(String username){
		return "Name:	" + username;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	/**
	 * 判断本用户是否具有指定url权限
	 * @param priUrl
	 * @return
	 */
	public boolean hasPrivilegeByUrl(String priUrl) {
		// TODO Auto-generated method stub
		/*添加一个管理员选项*/
		if(isAdmin()){
			return true;
		}
		System.out.println("User------》" + priUrl);
		for(Role role: roles){
			for(Privilege priv: role.getPrivileges()){
				if(priv.getUrl().equals(priUrl)){
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 判断用户是否具有指定name的权限
	 * @param name
	 * @return
	 */
	public boolean hasPriByN(String name){
		if(isAdmin()){  
            return true;  
        }  
        //判断普通用户是否有指定名称的权限  
        for(Role role:roles){  
            for(Privilege priv:role.getPrivileges()){  
                if(priv.getName().equals(name)){  
                    return true;  
                };                
            }  
        }  
        return false; 
	}
	
	private boolean isAdmin() {
		// TODO Auto-generated method stub
		return "admin".equals(username);
	}
}

