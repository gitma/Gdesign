/*
 * 文件： TestOp.java
 * 创建日期 2016年2月23日
 *
 */
package edu.just.test;

import java.util.ArrayList;
import java.util.List;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月23日 下午8:37:38)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class TestOp {

	public static void main(String[] args){
//		System.out.println(1!=1 && t());
		List list = new ArrayList<String>();
		testStr(list);
		List list2 = new ArrayList<Object>();
		testObj(list2);
	}
	
	public static boolean t(){
		
		System.out.println("aaa");
		return false;
	}
	
	
	public static List testStr(List<String> list){
		list.add("a");
		list.add(null);
		list.add("b");
		list.add(null);
		list.add("c");
		for(String str:list){
			System.out.println(str);
		}
		return list;
	}
	public static List testObj(List<Object> list){
		list.add("a");
		list.add(null);
		list.add("b");
		list.add(null);
		list.add("c");
		for(Object obj:list){
			System.out.println(obj);
		}
		return list;
	}
}

