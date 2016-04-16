/*
 * 文件： InitPrivilege.java
 * 创建日期 2016年2月14日
 *
 */
package edu.just.test;

import edu.just.entity.Privilege;
 
 /**
 * 
 * @Description: TODO(用于菜单初始化权限功能)
 * @date： (2016年2月14日 下午4:52:40)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class InitPrivilege {

	public static void main(String[] args){
		Privilege menu, menu1, menu2, menu3, menu4, menu5;
		menu = new Privilege("系统管理", "/", null);
		menu1 = new Privilege("部门管理", "/department_list", menu);
		menu2 = new Privilege("角色管理", "/role_list", menu);
		menu3 = new Privilege("用户管理", "/user_list", menu);
		
		
	}
}