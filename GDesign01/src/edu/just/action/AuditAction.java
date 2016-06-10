/*
 * 文件： AuditAction.java
 * 创建日期 2016年4月4日
 *
 */
package edu.just.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.just.common.PageBean;
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
		/*List<Category> categoryList = categoryService.findAll();
		 *
		 *ActionContext.getContext().put("categoryList", categoryList);
		 * */
		
		/*
		 * 使用分页效果显示，每页显示8条数据
		 * */
		
		PageBean recordList = null;
		recordList = categoryService.findCategory(pageNo, pageSize);
		ActionContext.getContext().getValueStack().push(recordList);
		return "list";
	}
	
	public String categoryNoAuditList() throws Exception{
		PageBean recordList = null;
		recordList = categoryService.findCategoryNoAudit(pageNo, pageSize);
		ActionContext.getContext().getValueStack().push(recordList);
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

	/*分页所需数据*/
	private Integer pageNo = 1;
	private Integer pageSize = 8;
	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}

