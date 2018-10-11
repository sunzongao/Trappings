package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.DepartmentMapper;
import cn.bdqn.pojo.Department;
import cn.bdqn.service.DepartmentService;
@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentMapper departmentMapper;
	@Override
	public List<Department> queryAllDept() {
		return departmentMapper.queryAllDept();
	}

}
