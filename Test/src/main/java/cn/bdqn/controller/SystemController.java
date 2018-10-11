package cn.bdqn.controller;

import java.util.List;

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
import cn.bdqn.service.DepartmentService;
import cn.bdqn.service.EmployeeService;
import cn.bdqn.service.JobService;
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
}
