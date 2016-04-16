/*
 * 文件： TestService.java
 * 创建日期 2016年1月29日
 *
 */
package edu.just.test;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.just.entity.User;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年1月29日 下午3:32:41)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Service("testService")
public class TestService {
	private Log log = LogFactory.getLog(this.getClass());
	@Resource
	private SessionFactory sessionFactory;
	@Transactional
	public void save(User user){
		log.info("-----开始TestService服务-----");
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		
	}
}

