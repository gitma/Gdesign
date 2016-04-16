/*
 * 文件： RoleAction.java
 * 创建日期 2016年2月6日
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

import edu.just.entity.Privilege;
import edu.just.entity.Role;
import edu.just.service.PrivilegeService;
import edu.just.service.RoleService;

/**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年2月6日 上午9:28:18)
 * @author: mas
 * 
 *          Modified history
 * 
 *          Modified date: Modifier user: description:
 * 
 * */

@Controller
@Scope("prototype")
public class RoleAction extends ActionSupport implements ModelDriven<Role> {

	@Resource
	private RoleService roleService;
	@Resource
	private PrivilegeService privilegeService;
	
	private Role model = new Role();
	private Integer[] privilegeIds;
	
	@Override
	public Role getModel() {
		// TODO Auto-generated method stub
		return model;
	}

	/* 查看 列表 */
	public String list() throws Exception {
		List<Role> roleList = roleService.findAll();
		ActionContext.getContext().put("roleList", roleList);
		return "list";
	}

	/* 添加 */
	public String add() throws Exception {
		roleService.save(model);
		return "toList";
	}

	/* 添加页面 */
	public String addUI() throws Exception {
		return "addUI";
	}

	/* 修改 */
	public String modify() throws Exception {
		Role role = roleService.findById(model.getId());
		role.setName(model.getName());
		role.setDescription(model.getDescription());
		roleService.modify(role);
		return "toList";
	}

	/* 修改页面 */
	public String modifyUI() throws Exception {
		//回显
		Role role = roleService.findById(model.getId());
		ActionContext.getContext().getValueStack().push(role);
		return "modifyUI";
	}

	/* 删除 */
	public String delete() throws Exception {
		return "toList";
	}

	/*修改权限页面*/
	public String privilegeUI() throws Exception{
		//准备回显的数据
		//准备数据
		Role role = roleService.findById(model.getId());
		ActionContext.getContext().getValueStack().push(role);
		if(null!=role.getPrivileges()){
			int index = 0;
			privilegeIds = new Integer[role.getPrivileges().size()];
			for(Privilege priv: role.getPrivileges()){
				privilegeIds[index++]=priv.getId();
			}
		}
		List<Privilege> privilegeList = privilegeService.findAll();
		ActionContext.getContext().put("privilegeList", privilegeList);
		return "privilegeUI";
	}
	
	/*修改权限操作*/
	public String setPrivilege() throws Exception{
		//准备数据
		Role role = roleService.findById(model.getId());
		//设置属性
		List<Privilege> privilegeList = privilegeService.findByIds(privilegeIds); 
		role.setPrivileges(new HashSet<Privilege>(privilegeList));
		//更新到数据库
		roleService.modify(role);
		return "toList";
	}
	public Integer[] getPrivilegeIds() {
		return privilegeIds;
	}

	public void setPrivilegeIds(Integer[] privilegeIds) {
		this.privilegeIds = privilegeIds;
	}

}
