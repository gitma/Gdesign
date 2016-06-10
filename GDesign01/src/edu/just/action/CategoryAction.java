/*
 * 文件： CategoryAction.java
 * 创建日期 2016年2月28日
 *
 */
package edu.just.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.just.common.PageBean;
import edu.just.entity.Category;
import edu.just.entity.Department;
import edu.just.entity.User;
import edu.just.service.CategoryService;
import edu.just.service.DepartmentService;
import edu.just.service.UserService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月28日 下午8:08:06)
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
public class CategoryAction extends ActionSupport implements ModelDriven<Category>{

	@Resource
	private CategoryService categoryService;
	@Resource
	private DepartmentService departmentService;
	@Resource 
	private UserService userService;
	
	private Integer departmentId;
	private Integer userId;
	

	private Category model = new Category(); 
	@Override
	public Category getModel() {
		// TODO Auto-generated method stub
		return model;
	}
	
	/*查看列表*/
	public String list() throws Exception{
		/*HttpSession session = ServletActionContext.getRequest().getSession();
		session.getAttribute("user");*/
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user!=null){
			System.out.println(user + "23333333333");
		}
		Integer userId = user.getId();
		
/*判断是否是管理人员*/
		List<Category> categoryList = null;
		if(user.getUsername().equals("admin")){
			categoryList = categoryService.findAll();
		}else{
			categoryList = categoryService.findAllCategoriesByUser(user);
		}
		
		ActionContext.getContext().put("categoryList", categoryList);
		
		/*部门列表*/
		List<Department> departmentList = departmentService.findAll();
		ActionContext.getContext().put("departmentList", departmentList);
		
		/*用户*/
		ActionContext.getContext().put("user", user);
		ActionContext.getContext().put("userId", userId);
		return "list";
		
		
	}
	
	/*删除*/
	public String delete() throws Exception{
		categoryService.delete(model.getId());
		return "toList";
	}
	
	/*添加页面*/
	public String addUI() throws Exception{
		
		return "addUI";
	}
	
	/*添加*/
	public String add() throws Exception{
		Department department = departmentService.findById(departmentId);
		User user = userService.findById(userId);
		model.setDepartment(department);
		model.setUser(user);
		categoryService.save(model);
		
		return "toList";
	}
	
	/*修改页面*/
	public String modifyUI() throws Exception{
		/*准备回显数据*/
		Category category = categoryService.findById(model.getId());
		ActionContext.getContext().getValueStack().push(category);
		
		return "modifyUI";
	}
	/*修改*/
	public String modify() throws Exception{
		Category category = categoryService.findById(model.getId());
		category.setName(model.getName());
		category.setDescription(model.getDescription());
		categoryService.update(category);
		return "toList";
	}
	
	/*显示周报信息 */
	public String show() throws Exception{
		User user = (User) ActionContext.getContext().getSession().get("user");
		Integer userId = user.getId();
//		List<Category> categoryList = categoryService.findAll();
//		ActionContext.getContext().put("categoryList", categoryList);
/*判断是否是管理人员*/
		PageBean recordList  = null;
		if(user.getUsername().equals("admin")){
			recordList = (PageBean) categoryService.findCategory(pageNo, pageSize);
		}else{
			recordList = (PageBean) categoryService.findCategoryByUser(pageNo, pageSize, user);
		}
		
		
		ActionContext.getContext().getValueStack().push(recordList);
		/*部门列表*/
		/*List<Department> departmentList = departmentService.findAll();
		ActionContext.getContext().put("departmentList", departmentList);*/
		
		/*用户*/
		/*ActionContext.getContext().put("user", user);
		ActionContext.getContext().put("userId", userId);*/
		return "show";
	}
	
	
	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/*分页所需数据*/
	private Integer pageNo = 1;
	private Integer pageSize = 5;
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

