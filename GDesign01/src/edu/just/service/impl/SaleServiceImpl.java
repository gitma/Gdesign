/*
 * 文件： SaleServiceImpl.java
 * 创建日期 2016年5月5日
 *
 */
package edu.just.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.just.dao.SaleDao;
import edu.just.entity.Sale;
import edu.just.service.SaleService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年5月5日 下午3:56:11)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Service
@Transactional
public class SaleServiceImpl implements SaleService{

	@Resource
	private SaleDao<Sale> saleDao;
	@Resource
	private SessionFactory sessionFactory;
	@Override
	public List<Sale> findAll() {
		// TODO Auto-generated method stub
		return saleDao.findAll();
	}
}

