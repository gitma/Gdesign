/*
 * 文件： Sign.java
 * 创建日期 2016年4月10日
 *
 */
package edu.just.entity;

import java.util.Date;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月10日 下午12:59:29)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:签到	
 * 
 * */
public class Sign {
	private Integer id;
	private Integer year;
	private Integer month;
	private Integer day;
	private Date lastSignDate;	//上次签到日期   唯一
	private Integer signCount;	//签到次数
	
	private User user;		//签到的用户

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public Date getLastSignDate() {
		return lastSignDate;
	}

	public void setLastSignDate(Date lastSignDate) {
		this.lastSignDate = lastSignDate;
	}

	public Integer getSignCount() {
		return signCount;
	}

	public void setSignCount(Integer signCount) {
		this.signCount = signCount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}

