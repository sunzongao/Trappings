package cn.bdqn.controller;
/**
 * ϵͳ����Ա
 */
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * ϵͳ����֣˼����
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
	 * Ա���б�
	 * 
	 * @return
	 */
	@RequestMapping("/jsp/tomember_list.html")
	public String tomemberlist(String pageindex, String begintime, String endtime, String eName, Model model) {
		// ��ȡԱ������
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
	 * Ա����Ϣչʾ
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
	 * չʾԱ���޸�ҳ��
	 */
	@RequestMapping("/jsp/EmployeeUpdate")
	public String toeEmployeeUpdate(String id, Model model) {
		id = id.substring(12, id.length());
		Employee e = employeeService.queryById(id);
		// ��ȡ���в��ż���
		List<Department> dept = departmentService.queryAllDept();
		// ��ȡ����ְλ����
		List<Job> joblist = jobService.queryAllJob();
		model.addAttribute("deptlist", dept);
		model.addAttribute("joblist", joblist);
		model.addAttribute("employee", e);
		return "employee_update";
	}

	/**
	 * Ա����Ϣ�޸�
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
	 * ���Ÿı�ʱ�޸�ְλ
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
	 * ����Ա��ҳ��
	 * 
	 * @return
	 */
	@RequestMapping("/jsp/addEmployee.html")
	public String toaddEmployee(Model model) {
		// ��ȡ���в��ż���
		List<Department> dept = departmentService.queryAllDept();
		// ��ȡ����ְλ����
		List<Job> joblist = jobService.queryAllJob();
		model.addAttribute("deptlist", dept);
		model.addAttribute("joblist", joblist);
		return "add_Employee";
	}

	/**
	 * ɾ��Ա��
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
	 * ����ɾ��
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
	 * ����Ա��
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
	 * ���Ų���
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
	 * ����Ա����
	 */
	@RequestMapping("jsp/userList.html")
	public String showUserList(String pageindex,String uname,String state,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		User user = userService.queryUser((String)SecurityUtils.getSubject().getPrincipal());
		//��ȡ�����û�
		PageUtil<User> util = userService.queryAllUser(temp,uname,state,user.getId());
		model.addAttribute("userlist",util);
		model.addAttribute("state",state);
		model.addAttribute("uname",uname);
		return "administrator_list";
	}
	/**
	 * �޸��û�״̬
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
	 * �û���Ȩ
	 */
	@RequestMapping("/jsp/administrator_edit")
	public String administator_edit(String name,int id,Model model) {
		name=name.substring(12,name.length());
		//��ȡ���û���ӵ�е����н�ɫ
		List<Role> urlist = roleService.queryAllRoleByUserId(id);
		//��ȡ���н�ɫ����
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
		String ok="��Ȩ�ɹ���";
		//��ո��û���ӵ�е����н�ɫ
		if(userService.deleteAllRoleById(uid)<=0) {
			ok="1";
		}
		//��Ȩ
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
	 * �޸Ľ�ɫӵ��Ȩ��
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
		//��ȡָ����ɫӵ�е�Ȩ��
		List<Permission> perlist = roleService.queryAllPerByRid(rid);
		//��ȡ����1��Ȩ�޼���
		List<Permission> p1 = permissionService.queryAllPer1();
		//��ȡ����2��Ȩ�޼���
		List<Permission> p2 = permissionService.queryAllPer2();
		//��ȡ��ǰ��ɫ����
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
		String result="�޸ĳɹ���";
		System.out.println("update");
		//ɾ���Ľ�ɫ��ӵ�е�����Ȩ��
		if(roleService.deleteperByrid(rid)<=0) {
			result="1";
		}
		//������Ȩ
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
