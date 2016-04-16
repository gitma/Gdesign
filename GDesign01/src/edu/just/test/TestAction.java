/*
 * 文件： TestAction.java
 * 创建日期 2016年1月26日
 *
 */
package edu.just.test;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年1月26日 下午4:29:51)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Controller("testA")
public class TestAction extends ActionSupport{
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("11111111111111111");
		return SUCCESS;
	}
	
}

