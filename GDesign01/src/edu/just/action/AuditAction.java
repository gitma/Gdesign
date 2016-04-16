/*
 * 文件： AuditAction.java
 * 创建日期 2016年4月4日
 *
 */
package edu.just.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.just.entity.Audit;
import edu.just.entity.Category;
import edu.just.service.CategoryService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月4日 下午3:53:27)
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
public class AuditAction extends ActionSupport implements ModelDriven<Audit>{

	@Resource
	private CategoryService categoryService;
	
	
	private Audit model = new Audit();
	
	private Integer categoryId;
	
	@Override
	public Audit getModel() {
		// TODO Auto-generated method stub
		return model;
	}

	public String list() throws Exception{
		/**/
		List<Category> categoryList = categoryService.findAll();
		ActionContext.getContext().put("categoryList", categoryList);
		
		return "list";
	}
	
	/*审核页面*/
	public String auditUI() throws Exception{
		/*将周报对象传递过去*/
		Category category = categoryService.findById(categoryId);
		ActionContext.getContext().getValueStack().push(category);
		return "auditUI";
	}
	
	/*审核通过*/
	public String pass() throws Exception{
		/*修改status为1*/
		Category category = categoryService.findById(categoryId);
		category.setStatue(1);
		categoryService.update(category);
		return "toList";
	}
	
	/*审核通过*/
	public String unpass() throws Exception{
		/*修改status为2*/
		Category category = categoryService.findById(categoryId);
		category.setStatue(2);
		categoryService.update(category);
		return "toList";
	}
	
	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	
}

