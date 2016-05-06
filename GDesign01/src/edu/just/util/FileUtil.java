/*
 * 文件： FileUtil.java
 * 创建日期 2016年4月27日
 *
 */
package edu.just.util;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import edu.just.entity.User;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月27日 下午5:08:14)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class FileUtil {

	/**
	 * 遍历指定目录下所有文件
	 * @param file	代表一个文件，也代表一个文件目录
	 * @param map 存储文件名的Map集合
	 */
	public static void listFile(File file, Map<String, String> map){
		
		if(!file.isFile()){//1、file代表一个目录
			//列出目录下所有文件和目录
			File [] files = file.listFiles();
			//遍历files数组
			for(File subF:files){
				listFile(subF, map);
			}
		}else{	//2、file不是一个目录
			//文件名是唯一的，可以作为key
			System.out.println(file.getName());
			map.put(file.getName(), file.getName());
		}
	}
	
	
	/**
	 * 遍历指定目录下所有文件
	 * @param file	代表一个文件，也代表一个文件目录
	 * @param map 存储文件名的Map集合，（其中value的值包含文件名&提供者姓名&文件路径&创建时间）信息
	 */
	public static void listFile(File file, Map<String, String> map, User user, String path, Date createTime){
		
		if(!file.isFile()){//1、file代表一个目录
			//列出目录下所有文件和目录
			File [] files = file.listFiles();
			//遍历files数组
			for(File subF:files){
				listFile(subF, map);
			}
		}else{	//2、file不是一个目录
			//文件名是唯一的，可以作为key
			System.out.println(file.getName());
			map.put(file.getName(),
									file.getName() + "&" +
									user==null?"":user + "&" + 
									createTime + "&" + path);
		}
	}
	public static void main(String[] args){
		Map<String, String> map = new HashMap<String, String>();
		File f = new File("F:\\DeskTop\\GDesign素材\\参考文献");
		listFile(f, map);
		System.out.println("aaa");
	}
}

