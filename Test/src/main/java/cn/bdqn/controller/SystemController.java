package cn.bdqn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
/**
 * ϵͳ����֣˼����
 * @author Administrator
 *
 */
import org.springframework.web.bind.annotation.RequestMapping;

import cn.bdqn.pojo.Employee;
import cn.bdqn.service.EmployeeService;
import cn.bdqn.util.PageUtil;
@Controller
public class SystemController {
	@Autowired
	private EmployeeService employeeService;
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
}

