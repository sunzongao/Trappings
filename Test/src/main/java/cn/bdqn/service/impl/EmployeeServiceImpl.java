package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.EmployeeMapper;
import cn.bdqn.pojo.Employee;
import cn.bdqn.service.EmployeeService;
import cn.bdqn.util.PageUtil;
@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	@Override
	public PageUtil<Employee> queryEmployeeByName(String eName, String begintime, String endtime, int pageindex) {
		PageUtil<Employee> util=new PageUtil<>();
		Map<String, Object>map=new HashMap<>();
		map.put("eName", eName);
		map.put("begintime", begintime);
		map.put("endtime", endtime);
		util.setTotalCount(employeeMapper.queryCount(map));
		util.setCurrentPage(pageindex);
		map.put("start", util.getStartRow());
		map.put("end", util.getPageSize());
		util.setLists(employeeMapper.queryEmployeeByName(map));
		return util;
	}
	@Override
	public Employee queryById(String employeeId) {
		return employeeMapper.queryById(employeeId);
	}
	@Override
	public int updateEmployeeById(Employee employee) {
		return employeeMapper.updateEmployeeById(employee);
	}
	@Override
	public int deleteEmployeeById(String employeeId) {
		return employeeMapper.deleteEmployeeById(employeeId);
	}
	@Override
	public int addEmployee(Employee employee) {
		return employeeMapper.addEmployee(employee);
	}

}
