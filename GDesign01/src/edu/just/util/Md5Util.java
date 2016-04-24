/*
 * 文件： Md5Util.java
 * 创建日期 2016年2月5日
 *
 */
package edu.just.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月5日 下午3:53:45)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
public class Md5Util {

	public final static String Md5Encrypt(String string){
		char[] strDigits = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
		
		byte[] btInput = string.getBytes();
				
		//获取MD5摘要算法的MessageDigest对象
		MessageDigest mdInst;
		try {
			mdInst = MessageDigest.getInstance("MD5");
			//使用指定字节跟新摘要
			mdInst.update(btInput);
			//获得密文
			byte[] md = mdInst.digest();
			//把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j*2];
			int k = 0;
			for(int i=0; i<j; i++){
				byte b = md[i];
				str[k++] = strDigits[b >>> 4 & 0xf];
				str[k++] = strDigits[b & 0xf];
			}
			return new String(str);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static void main(String[] args){
		System.out.println(Md5Util.Md5Encrypt("admin"));
		System.out.println(Md5Util.Md5Encrypt("小雅"));
	}
}

