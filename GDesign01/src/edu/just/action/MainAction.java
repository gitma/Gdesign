/*
 * 文件： MainAction.java
 * 创建日期 2016年2月15日
 *
 */
package edu.just.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月15日 下午8:24:46)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Controller
@Scope("prototype")
public class MainAction extends ActionSupport{
	/*首页*/
	public String index() throws Exception{
		return "index";
	}
	/*顶部菜单页面*/
	public String top() throws Exception{
		return "top";
	}
	/*左侧菜单*/
	public String left() throws Exception{
		return "left";
	}
	/*右侧菜单*/
	public String right() throws Exception{
		return "right";
	}
	/*底部菜单页面*/
	public String foot() throws Exception{
		return "foot";
	}

}

