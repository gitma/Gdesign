/*
 * 文件： GDexception.java
 * 创建日期 2016年4月28日
 *
 */
package edu.just.common;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月28日 下午2:54:57)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class GDException extends Exception{
	public String message; 
	public GDException(){};
	public GDException(String message){
		this.message = message;
	}
}

