/*
 * 文件： DateUtil.java
 * 创建日期 2016年5月10日
 *
 */
package edu.just.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年5月10日 上午9:41:42)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class DateUtil {

	
	public static String formatDateyyyyMMDD(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(date==null){
			date = new Date();
		}
		String dateStr = sdf.format(date);
		
		return dateStr;
	}
	
	public static void main(String[] args){
		Date d = new Date();
		
		String sd = formatDateyyyyMMDD(d);
		System.out.println(sd);
	}
}

