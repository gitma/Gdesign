/*
 * 文件： SignService.java
 * 创建日期 2016年4月10日
 *
 */
package edu.just.service;

import edu.just.entity.Sign;
import edu.just.entity.User;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月10日 下午1:42:13)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface SignService {

	void sign(User user);

	void save(Sign sign);

	void update(Sign sign);

	Sign findByUserAndDate(User user, int year, int month);

}

