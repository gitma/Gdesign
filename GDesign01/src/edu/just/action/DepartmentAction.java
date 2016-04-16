/*
 * 文件： DepartmentAction.java
 * 创建日期 2016年2月3日
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

import edu.just.entity.Department;
import edu.just.service.DepartmentService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月3日 下午3:36:11)
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
public class DepartmentAction extends ActionSupport implements ModelDriven<Department>{
	@Resource
	private DepartmentService departmentService;
	
	private Department model = new Department();
	private Integer parentId;
	
	@Override
	public Department getModel() {
		// TODO Auto-generated method stub
		return model;
	}
	/*查看 列表*/
	public String list() throws Exception{
		List<Department> departmentList = null;
		if(parentId == null){//顶级部门列表
			departmentList = departmentService.findTopList();
		} else{//自部门列表
			
			departmentList = departmentService.findChildren(parentId);
			Department parent = departmentService.findById(parentId);
			ActionContext.getContext().put("parent", parent);
		}
		ActionContext.getContext().put("departmentList", departmentList);
		return "list";
	}  
	/*添加*/
	public String add() throws Exception{
		Department parent = departmentService.findById(parentId);
		model.setParent(parent);
		departmentService.save(model);
		return "toList";
	}
	/*添加页面*/
	public String addUI() throws Exception{
//		List<Department> topList = departmentService.findTopList();
		List<Department> departmentList = departmentService.findAll();
//		List<Department> departmentList = departmentService.findTopList();
		ActionContext.getContext().put("departmentList", departmentList);
		return "addUI";
	}
	/*修改*/
	public String modify() throws Exception{
		Department department = departmentService.findById(model.getId());
		department.setName(model.getName());
		department.setDescription(model.getDescription());
		department.setParent(departmentService.findById(parentId));//设置所属上级部门
		departmentService.modify(department);
		return "toList";
	}
	/*修改页面*/
	public String modifyUI() throws Exception{
		List<Department> departmentList = departmentService.findTopList();
		ActionContext.getContext().put("departmentList", departmentList);
		Department department = departmentService.findById(model.getId());
		ActionContext.getContext().getValueStack().push(department);
		if(department.getParent()!=null){
			parentId = department.getParent().getId();
		}
		return "modifyUI";
	}
	/*删除*/
	public String delete() throws Exception{
		departmentService.delete(model.getId());
		return "toList";
	}
	
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
}

