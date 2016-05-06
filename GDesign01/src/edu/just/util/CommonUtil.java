/*
 * 文件： CommonUtil.java
 * 创建日期 2016年4月28日
 *
 */
package edu.just.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import edu.just.common.GDException;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月28日 下午2:48:15)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class CommonUtil {
	
	/**
	 * 将map转换为list
	 * @param map
	 * @return
	 * @throws GDException
	 */
	public static List ConvertMapToList(Map<String, String> map) throws GDException{
		List listValue = new ArrayList();
		
		Iterator it = map.keySet().iterator();
		while(it.hasNext()){
			String key = it.next().toString();
			
			listValue.add(map.get(key));
		}
		return listValue;
	}
	
	
	
}

