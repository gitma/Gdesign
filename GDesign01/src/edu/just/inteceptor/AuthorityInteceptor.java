/*
 * 文件： AuthorityInteceptor.java
 * 创建日期 2016年2月21日
 *
 */
package edu.just.inteceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import edu.just.entity.User;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月21日 下午12:30:03)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class AuthorityInteceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("——>之前");
//		String result = invocation.invoke();//放行
//		System.out.println("之后-----");
		
		//获取登录的用户信息
		User user = (User) ActionContext.getContext().getSession().get("user");
		String actionN = invocation.getProxy().getActionName();
		String nameSp = invocation.getProxy().getNamespace();
		//对应的权限URL
		String priUrl = nameSp + actionN;
		System.out.println(priUrl);
		
		// 如果未登录
				if (user == null) {
					System.out.println("user==null------>" + priUrl);
					if (priUrl.startsWith("/user_login") || priUrl.startsWith("/user_logout")) { // "/user_loginUI", "/user_login"
						// 如果是去登录，就放行
						return invocation.invoke();
					} else {
						// 如果不是去登录，就转到登录页面
						return "loginUI";
					}
				}
				// 如果已登 录，就判断权限
				else {
					if (user.hasPrivilegeByUrl(priUrl)) {
						// 如果有权限，就放行
						return invocation.invoke();
					} else {
						// 如果没有权限，就转到提示页面
						return "stopPage";
					}
				}
//		//如果用户没有登录
//		return (user!=null && user.hasPrivilegeByUrl(priUrl))?priUrl.startsWith("/user_login")?invocation.invoke():"loginUI";
//		return invocation.invoke();
	}

}

