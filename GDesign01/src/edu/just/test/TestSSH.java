/*
 * 文件： TestSpring.java
 * 创建日期 2016年1月26日
 *
 */
package edu.just.test;


import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import edu.just.dao.UserDao;
import edu.just.entity.Department;
import edu.just.entity.Privilege;
import edu.just.entity.User;
import edu.just.service.DepartmentService;
import edu.just.service.UserService;
import edu.just.util.Md5Util;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年1月26日 下午6:24:09)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@SuppressWarnings("unchecked")
public class TestSSH {

	private static ApplicationContext ac;
	private static SessionFactory sessionFactory;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		sessionFactory = (SessionFactory) ac.getBean("sessionFactory"); 
	}

	@Test
	public void testSpring() throws Exception {
		TestAction testAction = (TestAction) ac.getBean("testA");
	}

	@Test
	public void testHibernate() throws Exception{
		SessionFactory sessionFactory = (SessionFactory) ac.getBean("sessionFactory");
		System.out.println(sessionFactory);
		Session session = (Session) sessionFactory.openSession();
		System.out.println("Session " + session);
		session.save(new User("yyCat", "18"));

		session.close();
	}
	
	@Test
	public void testTransaction() throws Exception{
		TestService ts = (TestService) ac.getBean("testService");
		ts.save(new User("yyDog", "20"));
//		int a = 1/0;
		ts.save(new User("yyDogg", "22"));
	}
	

	@Test
	public void testReflect() throws Exception{
		UserDao<User> userDao = (UserDao<User>) ac.getBean("userDaoImpl");
//		User user = (User) userDao.findById(1);
//		User user2 = new User("223", "001");
//		userDao.save(user2);
		
		Integer[] ite = {1,3};
		List<User> users = userDao.findByIds(ite);
		for(int i=0; i<users.size(); i++){
			System.out.println(users.get(i).getUsername());
		}
		
		List<User> uuList = (List<User>) userDao.findByNames(new String[]{"yyCat"});
		System.out.println(uuList.size());
//		System.out.println(user);
	}
	
	@Test
	public void testService() throws Exception{
		UserService userService = (UserService) ac.getBean("userServiceImpl");
		List<User> userList = userService.findAll();
		System.out.println(userList.size());
	}
	
	@Test
	public void testServiceFindByIdMethod() throws Exception{
		DepartmentService deptService = (DepartmentService) ac.getBean("departmentServiceImpl");
		System.out.println(deptService);
		Department dept = deptService.findById(1);
		System.out.println(dept.getName());
	}
	
	@Test
	@Transactional
	public void testInitPrivilege() throws Exception{
		Session session= sessionFactory.openSession();
		// 保存超级管理员用户
		User user = new User();
		user.setUsername("admin");
		user.setRealname("超级管理员");
		user.setPassword(Md5Util.Md5Encrypt("admin"));
		session.save(user); // 保存

		// ==============================================================
		// 保存权限数据
		Privilege menu, menu1, menu2, menu3, menu4, menu5;

		// --------------------
		menu = new Privilege("系统管理", null, null);
		menu1 = new Privilege("岗位管理", "/role_list", menu);
		menu2 = new Privilege("部门管理", "/department_list", menu);
		menu3 = new Privilege("用户管理", "/user_list", menu);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);

		session.save(new Privilege("岗位列表", "/role_list", menu1));
		session.save(new Privilege("岗位删除", "/role_delete", menu1));
		session.save(new Privilege("岗位添加", "/role_add", menu1));
		session.save(new Privilege("岗位修改", "/role_edit", menu1));

		session.save(new Privilege("部门列表", "/department_list", menu2));
		session.save(new Privilege("部门删除", "/department_delete", menu2));
		session.save(new Privilege("部门添加", "/department_add", menu2));
		session.save(new Privilege("部门修改", "/department_edit", menu2));

		session.save(new Privilege("用户列表", "/user_list", menu3));
		session.save(new Privilege("用户删除", "/user_delete", menu3));
		session.save(new Privilege("用户添加", "/user_add", menu3));
		session.save(new Privilege("用户修改", "/user_edit", menu3));
		session.save(new Privilege("初始化密码", "/user_initPassword", menu3));

		// --------------------
		menu = new Privilege("工作管理", null, null);
		menu1 = new Privilege("周报管理", "/category_list", menu);
		menu2 = new Privilege("周报", "/context_list", menu);
		menu3 = new Privilege("签到", "/sign_list", menu);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);

		// --------------------
		menu = new Privilege("工作台", null, null);
		menu1 = new Privilege("个人信息", "/processDefinition_list", menu);
		menu2 = new Privilege("我的周报", "/template_list", menu);
		menu3 = new Privilege("我的签到", "/flow_templateList", menu);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
	}
}

