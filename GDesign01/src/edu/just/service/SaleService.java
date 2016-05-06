/*
 * 文件： SaleService.java
 * 创建日期 2016年5月5日
 *
 */
package edu.just.service;

import java.util.List;

import edu.just.entity.Sale;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年5月5日 下午3:55:57)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public interface SaleService {

	List<Sale> findAll();

}

