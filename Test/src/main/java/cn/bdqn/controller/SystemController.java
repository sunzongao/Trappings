package cn.bdqn.controller;
/**
 * 系统管理员
 */
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * 系统管理（郑思房）
 * @author Administrator
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Department;
import cn.bdqn.pojo.Employee;
import cn.bdqn.pojo.Job;
import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.Role;
import cn.bdqn.pojo.User;
import cn.bdqn.service.DepartmentService;
import cn.bdqn.service.EmployeeService;
import cn.bdqn.service.JobService;
import cn.bdqn.service.PermissionService;
import cn.bdqn.service.RoleService;
import cn.bdqn.service.UserService;
import cn.bdqn.util.JSONUtils;
import cn.bdqn.util.PageUtil;

@Controller
public class SystemController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private JobService jobService;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PermissionService permissionService;
	/**
	 * 员工列表
	 * 
	 * @return
	 */
	@RequestMapping("/jsp/tomember_list.html")
	public String tomemberlist(String pageindex, String begintime, String endtime, String eName, Model model) {
		// 获取员工集合
		int temp = 1;
		if (pageindex != null) {
			temp = Integer.parseInt(pageindex);
		}
		PageUtil<Employee> util = employeeService.queryEmployeeByName(eName, begintime, endtime, temp);
		model.addAttribute("util", util);
		model.addAttribute("begintime", begintime);
		model.addAttribute("endtime", endtime);
		model.addAttribute("eName", eName);
		return "member_list";
	}

	/**
	 * 员工信息展示
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/showEmployee")
	public String showEmployee(String id, Model model) {
		id = id.substring(12, id.length());
		Employee e = employeeService.queryById(id);
		model.addAttribute("employee", e);
		return "Show_Employee";
	}

	/**
	 * 展示员工修改页面
	 */
	@RequestMapping("/jsp/EmployeeUpdate")
	public String toeEmployeeUpdate(String id, Model model) {
		id = id.substring(12, id.length());
		Employee e = employeeService.queryById(id);
		// 获取所有部门集合
		List<Department> dept = departmentService.queryAllDept();
		// 获取所有职位集合
		List<Job> joblist = jobService.queryAllJob();
		model.addAttribute("deptlist", dept);
		model.addAttribute("joblist", joblist);
		model.addAttribute("employee", e);
		return "employee_update";
	}

	/**
	 * 员工信息修改
	 * 
	 * @param employee
	 * @return
	 */
	@RequestMapping("/jsp/doEmployeeUpdate")
	@ResponseBody
	public String doEmployeeUpdate(Employee employee) {
		if (employeeService.updateEmployeeById(employee) > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 部门改变时修改职位
	 * 
	 * @param departmentId
	 * @return
	 */
	@RequestMapping(value = "/jsp/updateJob", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String doupdateJoblist(int departmentId) {
		List<Job> joblist = jobService.queryJobByDepartmentId(departmentId);
		return JSONUtils.beanToJson(joblist);
	}

	/**
	 * 新增员工页面
	 * 
	 * @return
	 */
	@RequestMapping("/jsp/addEmployee.html")
	public String toaddEmployee(Model model) {
		// 获取所有部门集合
		List<Department> dept = departmentService.queryAllDept();
		// 获取所有职位集合
		List<Job> joblist = jobService.queryAllJob();
		model.addAttribute("deptlist", dept);
		model.addAttribute("joblist", joblist);
		return "add_Employee";
	}

	/**
	 * 删除员工
	 * 
	 * @param employeeId
	 * @return
	 */
	@RequestMapping("/jsp/employeeDelete")
	@ResponseBody
	public String employeeDelete(String employeeId) {
		if (employeeService.deleteEmployeeById(employeeId) > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 批量删除
	 */
	@RequestMapping("/jsp/todeleteitem")
	@ResponseBody
	public String deleteitem(String id) {
		String[] split = id.split(",");
		String a = "";
		for (int i = 0; i < split.length; i++) {
			if (employeeService.deleteEmployeeById(split[i]) > 0) {
				a = "true";
			} else {
				a = "false";
			}
		}
		return a;
	}
	/**
	 * 新增员工
	 * @param employee
	 * @return
	 */
	@RequestMapping("/jsp/addemployee")
	@ResponseBody
	public String doaddemployee(Employee employee) {
		if(employeeService.addEmployee(employee)>0) {
			return "true";
		}
		return "false";
	}
	/**
	 * 工号查重
	 */
	@RequestMapping("/jsp/checkid")
	@ResponseBody
	public String checkname(String employeeId) {
		if(employeeService.queryById(employeeId)!=null) {
			return "true";
		}
		return "false";
	}
	/**
	 * 管理员设置
	 */
	@RequestMapping("jsp/userList.html")
	public String showUserList(String pageindex,String uname,String state,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		User user = userService.queryUser((String)SecurityUtils.getSubject().getPrincipal());
		//获取所有用户
		PageUtil<User> util = userService.queryAllUser(temp,uname,state,user.getId());
		model.addAttribute("userlist",util);
		model.addAttribute("state",state);
		model.addAttribute("uname",uname);
		return "administrator_list";
	}
	/**
	 * 修改用户状态
	 */
	@RequestMapping("/jsp/updateUserState")
	@ResponseBody
	public String updateUseState(int id,int state) {
		if(userService.updateUserStateById(id, state)>0) {
			return "true";
		}
		return "false";
	}
	/**
	 * 用户授权
	 */
	@RequestMapping("/jsp/administrator_edit")
	public String administator_edit(String name,int id,Model model) {
		name=name.substring(12,name.length());
		//获取该用户所拥有的所有角色
		List<Role> urlist = roleService.queryAllRoleByUserId(id);
		//获取所有角色集合
		List<Role> rolelist = roleService.queryAllRole();
		model.addAttribute("rolelist",rolelist);
		model.addAttribute("urlist",urlist);
		model.addAttribute("name",name);
		model.addAttribute("id",id);
		return "administrator_edit";
	}
	@RequestMapping(value="/jsp/updateRole",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String repower(int uid,String rid,boolean newrole) {
		String ok="授权成功！";
		//清空该用户所拥有的所有角色
		if(userService.deleteAllRoleById(uid)<=0) {
			ok="1";
		}
		//授权
		if(newrole){
			String[] split = rid.split(",");
			for(int i=0;i<split.length;i++) {
				if(userService.addRoleById(uid, Integer.parseInt(split[i]))<=0) {
					ok="2";
				}
			}
		}
		return ok;
	}
	/**
	 * 修改角色拥有权限
	 * @return
	 */
	@RequestMapping("/jsp/roleList.html")
	public String permisionsList(String pageindex,String rname,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		PageUtil<Role> util = roleService.queryAllBysomething(temp, rname);
		model.addAttribute("util",util);
		model.addAttribute("rname",rname);
		return "Permission_edit";
	}
	@RequestMapping("/jsp/permision_edit")
	public String permisionEdit(int rid,Model model) {
		//获取指定角色拥有的权限
		List<Permission> perlist = roleService.queryAllPerByRid(rid);
		//获取所有1级权限集合
		List<Permission> p1 = permissionService.queryAllPer1();
		//获取所有2级权限集合
		List<Permission> p2 = permissionService.queryAllPer2();
		//获取当前角色对象
		Role role = roleService.queryByid(rid);
		model.addAttribute("perlist",perlist);
		model.addAttribute("p1list",p1);
		model.addAttribute("p2list",p2);
		model.addAttribute("role",role);
		return "permission_power";
	}
	@RequestMapping(value="/jsp/updatePerByRid",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String doperupdate(int rid,String pid,boolean b) {
		String result="修改成功！";
		System.out.println("update");
		//删除改角色所拥有的所有权限
		if(roleService.deleteperByrid(rid)<=0) {
			result="1";
		}
		//重新授权
		if(b) {
			String[] split = pid.split(",");
			for(int i=0;i<split.length;i++) {
				if(roleService.addRolePer(rid, Integer.parseInt(split[i]))<=0) {
					result="2";
				}
			}
		}
		return result;
	}
	
	
}
