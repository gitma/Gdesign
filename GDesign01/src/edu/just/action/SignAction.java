/*
Li * 文件： SignAction.java
 * 创建日期 2016年4月10日
 *
 */
package edu.just.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.just.entity.Sign;
import edu.just.entity.User;
import edu.just.service.SignService;
import edu.just.util.DateUtil;
 
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
	
	private Date startTime;
	private Date endTime;
	
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
		
		//查看用户该月是否有签到记录
		List<Sign> signList = signService.findByUserAndDate(user, year, month);
		if(signList!=null && signList.size()>0){
			
			Calendar calendar2 = Calendar.getInstance();
			calendar.setTime(signList.get(0).getLastSignDate());
			int day = calendar2.get(Calendar.DATE) - calendar.get(Calendar.DATE);
			/*判断当天是否有签过 day！=0 表示未签到*/
			if(day!=0){
				Sign todaySign = new Sign();
				todaySign.setYear(year);
				todaySign.setMonth(month);
				todaySign.setLastSignDate(new Date());
				todaySign.setSignCount(signList.get(0).getSignCount() + 1);
				todaySign.setDay(calendar2.get(Calendar.DATE));
				todaySign.setUser(user);
				signService.save(todaySign);
			}/*弹出重复签到的框框*/
				
			else{
				return "repeatSignUI";
			}
		}else{
			Sign sign = new Sign();
			sign.setYear(year);
			sign.setMonth(month);
			sign.setDay(calendar.get(Calendar.DATE));
			sign.setSignCount(1);
			sign.setUser(user);
			sign.setLastSignDate( new Date());
			
			signService.save(sign);
		}
		return "signUI";
		
	}
	
	public String signUI() throws Exception{
		return "signUI";
	}
	
	/*查看签到历史*/
	public String signHistory() throws Exception{
		/**/
		User user = (User) ActionContext.getContext().getSession().get("user");
		//
	/*	Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		*/
		List<Sign> signList = signService.findSignHistoryByUserAndDate(user, startTime, endTime);
		ActionContext.getContext().put("signList", signList);
		ActionContext.getContext().put("show_startTime", DateUtil.formatDateyyyyMMDD(startTime));
		ActionContext.getContext().put("show_endTime", DateUtil.formatDateyyyyMMDD(endTime));
		return "signHistory";
	}
	

	
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
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

