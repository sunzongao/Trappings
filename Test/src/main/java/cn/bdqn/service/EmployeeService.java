package cn.bdqn.service;

import cn.bdqn.pojo.Employee;
import cn.bdqn.util.PageUtil;

public interface EmployeeService {
	public PageUtil<Employee> queryEmployeeByName(String eName,String begintime,String endtime,int pageindex);
}
