/*
 * 文件： ServletContenxtL.java
 * 创建日期 2016年2月16日
 *
 */
package edu.just.util;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import edu.just.entity.Privilege;
import edu.just.service.PrivilegeService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月16日 下午5:05:44)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Component
public class ServletContenxtL implements ServletContextListener{

	/*
	 * 因为不受Spring容器控制，随意不能从容器中取
	 * @Resource
	private PrivilegeService privilegeService;*/
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		PrivilegeService privilegeService = (PrivilegeService) ac.getBean("privilegeServiceImpl");
		List<Privilege> privilegeTopList = privilegeService.findTopList();
		sce.getServletContext().setAttribute("privilegeTopList", privilegeTopList);
		System.out.println("ServletContextListener  Start....");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("ServervletContextListenrer destoryed...");
	}

	

}

