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

import cn.bdqn.pojo.Department;
import cn.bdqn.pojo.Employee;
import cn.bdqn.pojo.Job;
import cn.bdqn.service.DepartmentService;
import cn.bdqn.service.EmployeeService;
import cn.bdqn.service.JobService;
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
	 * @return
	 */
	@RequestMapping("/jsp/tomember_list.html")
	public String tomemberlist(String pageindex,String begintime,String endtime,String eName,Model model) {
		//��ȡԱ������
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		PageUtil<Employee> util = employeeService.queryEmployeeByName(eName, begintime, endtime, temp);
		model.addAttribute("util",util);
		model.addAttribute("begintime",begintime);
		model.addAttribute("endtime",endtime);
		model.addAttribute("eName",eName);
		return "member_list";
	}
	/**
	 * Ա����Ϣչʾ
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/showEmployee")
	public String showEmployee(String id,Model model) {
		id=id.substring(12, id.length());
		Employee e=employeeService.queryById(id);
		model.addAttribute("employee",e);
		return "Show_Employee";
	}
	/**
	 * չʾԱ���޸�ҳ��
	 */
	@RequestMapping("/jsp/EmployeeUpdate")
	public String toeEmployeeUpdate(String id,Model model) {
		id=id.substring(12, id.length());
		Employee e=employeeService.queryById(id);
		//��ȡ���в��ż���
		List<Department> dept = departmentService.queryAllDept();
		//��ȡ����ְλ����
		List<Job> joblist = jobService.queryAllJob();
		model.addAttribute("deptlist",dept);
		model.addAttribute("joblist",joblist);
		model.addAttribute("employee",e);
		return "employee_update";
	}
	@RequestMapping("/jsp/doEmployeeUpdate")
	public String doEmployeeUpdate() {
		System.out.println("#####doupdate#######");
		return "forward:goback";
	}
}

