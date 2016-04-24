/*
 * 文件： PageBean.java
 * 创建日期 2016年4月9日
 *
 */
package edu.just.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月9日 下午1:31:11)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:分页工具类	
 * 
 * */
public class PageBean {
	private Integer pageNo;		//当前页
	private Integer pageSize;	//每页显示数量

	private String querySql;	//指定查询的sql语句
	private Integer queryTotal;	//查询总记录数

	private Integer recordCount;	//总记录数
	private Integer totalPage;	//总页数
	private List recordList;	//查询出的记录
	
	private Integer beginIndex;
	private Integer endIndex;
	
	

	public PageBean(Integer pageNo, Integer pageSize, Integer recordCount, List recordList){
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		this.recordList = recordList;
		//计算总页码
		totalPage = recordCount%pageSize==0?recordCount/pageSize:(recordCount/pageSize + 1);
		this.pageNo = pageNo<=0?1:pageNo>=totalPage?totalPage-1:pageNo;
		
		beginIndex = pageNo -1;
		endIndex = pageNo + 2;
		
		beginIndex = beginIndex<=0?1:beginIndex>totalPage?totalPage:beginIndex;
		endIndex = endIndex<=0?1:endIndex>totalPage?totalPage:endIndex;
	}
	

	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String getQuerySql() {
		return querySql;
	}
	public void setQuerySql(String querySql) {
		this.querySql = querySql;
	}
	public Integer getQueryTotal() {
		return queryTotal;
	}
	public void setQueryTotal(Integer queryTotal) {
		this.queryTotal = queryTotal;
	}
	public Integer getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public List getRecordList() {
		return recordList;
	}
	public void setRecordList(List recordList) {
		this.recordList = recordList;
	}
	public Integer getBeginIndex() {
		return beginIndex;
	}


	public void setBeginIndex(Integer beginIndex) {
		this.beginIndex = beginIndex;
	}


	public Integer getEndIndex() {
		return endIndex;
	}


	public void setEndIndex(Integer endIndex) {
		this.endIndex = endIndex;
	}

	public static void main(String[] args){
		List list = new ArrayList();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		list.add(5);
		list.add(1);
		PageBean pb = new PageBean(0, 5, 6, list);
		System.out.println(pb.pageNo);
		System.out.println("Time" + new Date().getTime());
	}
}

