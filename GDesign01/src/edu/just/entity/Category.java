/*
 * 文件： Category.java
 * 创建日期 2016年2月27日
 *
 */
package edu.just.entity;

import java.util.Date;
import java.util.Set;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月27日 上午11:42:43)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class Category {
	
	private Integer id;
	private String name;
	private String description;
	private Date createdTime;
	private Date lastModifyTime;
	private Integer titleCount;	//标题数量
	
	private Set<Title> titles;  /*//标题---项目完成阶段       1、需求初步沟通	2、需求分析	
	
													3、概要设计		4、原型设计	
													5、编码		6、单元测试	
													7、集成测试		8、UAT测试
													9、压力测试		10、变更处理
													11、故障处理	12、日常运维
													13、文档提交*/						
	private String jobPercent;//本工作完成百分比
	private Department department;//所属项目组
	
	private User user;//设置操作人
	
	private Integer statue;//周报审批状态默认为0：未审批	1、审批通过
	
	public String getJobPercent() {
		return jobPercent;
	}
	public void setJobPercent(String jobPercent) {
		this.jobPercent = jobPercent;
	}
	
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Date getLastModifyTime() {
		return lastModifyTime;
	}
	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}
	public Integer getTitleCount() {
		return titleCount;
	}
	public void setTitleCount(Integer titleCount) {
		this.titleCount = titleCount;
	}
	public Set<Title> getTitles() {
		return titles;
	}
	public void setTitles(Set<Title> titles) {
		this.titles = titles;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Integer getStatue() {
		return statue;
	}
	public void setStatue(Integer statue) {
		this.statue = statue;
	}
}

