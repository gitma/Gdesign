/*
 * 文件： UserAction.java
 * 创建日期 2016年2月2日
 *
 */
package edu.just.action;

import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.just.common.CommonAction;
import edu.just.common.PageBean;
import edu.just.entity.Department;
import edu.just.entity.Privilege;
import edu.just.entity.Role;
import edu.just.entity.User;
import edu.just.service.DepartmentService;
import edu.just.service.PrivilegeService;
import edu.just.service.RoleService;
import edu.just.service.UserService;
import edu.just.util.Md5Util;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月2日 下午3:32:21)
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
public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	@Resource
	private UserService userService;
	@Resource
	private DepartmentService departmentService;
	@Resource
	private RoleService roleService;
	
	private User model = new User();
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return model;
	}
	
	private Integer departmentId;
	private Integer[] roleIds;
	
	/*查看 列表*/
	public String list() throws Exception{
//		List<User> userList = userService.findAll();
//		ActionContext.getContext().put("userList", userList);
		PageBean recordList = (PageBean) userService.findUser(pageNo, pageSize);
		ActionContext.getContext().getValueStack().push(recordList);
//		ActionContext.getContext().put("recordList", recordList);
//		/*部门和岗位*/
		return "list";
	}
	
	/*添加*/
	public String add() throws Exception{
		/*设置部门*/
		model.setDepartment(departmentService.findById(departmentId));
		/*设置岗位*/
		List<Role> roleList = roleService.findByIds(roleIds);
		model.setRoles(new HashSet<Role>(roleList));
	
		model.setPassword(Md5Util.Md5Encrypt("1234"));
//System.out.println("未加密之前的密码 ： " + newP + "\b" + "加密后的密码 ：" + Md5Util.Md5Encrypt(newP));	
		userService.save(model);
		return "toList";
	}
	/*添加页面*/
	public String addUI() throws Exception{
		/*设置部门*/
		List<Department> departmentList = departmentService.findAll();
		ActionContext.getContext().put("departmentList", departmentList);
		/*设置岗位*/
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);
		return "addUI";
	}
	/*修改*/
	public String modify() throws Exception{
		User user = userService.findById(model.getId());
		user.setUsername(model.getUsername());
		user.setGender(model.getGender());
		user.setTelephone(model.getTelephone());
		user.setEmail(model.getEmail());
		user.setDescription(model.getDescription());
		user.setDepartment(departmentService.findById(departmentId));
		/*设置岗位*/
		List<Role> roleList = roleService.findByIds(roleIds);
		user.setRoles(new HashSet<Role>(roleList));
		userService.modify(user);
		return "toList";
	}
	/*修改页面*/
	public String modifyUI() throws Exception{
		/*设置部门*/
		List<Department> departmentList = departmentService.findAll();
		ActionContext.getContext().put("departmentList", departmentList);
		/*设置岗位*/
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);
		
		/*设置回显*/
		User user = userService.findById(model.getId());
		ActionContext.getContext().getValueStack().push(user);
		if(user.getDepartment()!=null){
			departmentId = user.getDepartment().getId();
		}
		if(user.getRoles()!=null){
			roleIds = new Integer[user.getRoles().size()];
			int index = 0;
			for (Role role : user.getRoles()) {
				roleIds[index++] = role.getId();
			}
		}
		return "modifyUI";
	}
	
	/*显示个人信息*/
	public String info() throws Exception{
		User user = (User) ActionContext.getContext().getSession().get("user");
		Department department = user.getDepartment();
		/*所属部门*/
		ActionContext.getContext().getValueStack().push(department);
		ActionContext.getContext().getValueStack().push(user);
		return "info";
	}
	/*删除*/
	public String delete() throws Exception{
		return "toList";
	}
	
	/*登入界面*/
	public String loginUI() throws Exception{
		return "loginUI";
	}
	/*登入操作*/
	public String login() throws Exception{
		
		User user = userService.findByNameAndPwd(model.getUsername(), Md5Util.Md5Encrypt(model.getPassword()));
		if(null==user){
			addFieldError("errorMsg", "用户名或密码有误");
			System.out.println("222222222222222");
			return "loginUI";
		}
		System.out.println(user.getUsername() + user.getPassword() + "11111111111111111");
		ActionContext.getContext().getSession().put("user", user);
		return "toIndex";
	}
	/*注销界面*/
	public String logoutUI() throws Exception{
		ActionContext.getContext().getSession().remove("user");
		return "toIndex";
	}
	
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public Integer[] getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(Integer[] roleIds) {
		this.roleIds = roleIds;
	}
	
	/*分页所需数据*/
	private Integer pageNo = 1;
	private Integer pageSize = 7;
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

