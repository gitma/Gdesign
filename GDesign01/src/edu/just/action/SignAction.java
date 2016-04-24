/*
 * 文件： SignAction.java
 * 创建日期 2016年4月10日
 *
 */
package edu.just.action;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.just.entity.Sign;
import edu.just.entity.User;
import edu.just.service.SignService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月10日 下午1:24:09)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Controller
@Scope("prototype")
public class SignAction extends ActionSupport implements ModelDriven<Sign>{
	
	@Resource
	private SignService signService;
	
	private Sign model = new Sign();
	@Override
	public Sign getModel() {
		// TODO Auto-generated method stub
		return model;
	}
	
	/*签到*/
	public String sign() throws Exception{
		/**/
		User user = (User) ActionContext.getContext().getSession().get("user");
		//
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		System.out.println("year  :" + year + "month  :" + month);
		
		
		//查看用户该月是否有签到记录
		Sign sign = signService.findByUserAndDate(user, year, month);
		if(sign!=null){
			Calendar calendar2 = Calendar.getInstance();
			calendar.setTime(sign.getLastSignDate());
			int day = calendar2.get(Calendar.DATE) - calendar.get(Calendar.DATE);
			if(day!=0){
				sign.setLastSignDate(new Date());
				sign.setSignCount(sign.getSignCount() + 1);
				sign.setDay(sign.getDay() + calendar.get(Calendar.DATE));
				signService.update(sign);
			}/*弹出重复签到的框框
				
			else{
				return "toRepeatSignUI";
			}*/
		}else{
			sign = new Sign();
			sign.setYear(year);
			sign.setMonth(month);
			sign.setDay(calendar.get(Calendar.DATE));
			sign.setSignCount(1);
			sign.setUser(user);
			sign.setLastSignDate( new Date());
			
			signService.save(sign);
		}
		return "toIndex";
		
	}
	
	public String signUI() throws Exception{
		return "signUI";
	}
	
	/*查看签到历史*/
	public String signHistory() throws Exception{
		
		return "";
	}
	
	public static void main(String[] args){
		Calendar cal = Calendar.getInstance();
		int year, month, day;
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH) + 1;
		day = cal.get(Calendar.DATE);
		
		System.out.println(year + "  " + month + "\t" + day );
		System.out.println(new Date());
	}
}

