/*
 * 文件： Title.java
 * 创建日期 2016年2月27日
 *
 */
package edu.just.entity;

import java.util.Set;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月27日 上午11:42:14)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class Title {

	private Integer id;
	private String name;
	private String description;

	private Category category;	//所属类别
	private Set<Content> contents;	//内容
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
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Set<Content> getContents() {
		return contents;
	}
	public void setContents(Set<Content> contents) {
		this.contents = contents;
	}

	
}

