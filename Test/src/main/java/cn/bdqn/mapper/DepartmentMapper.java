package cn.bdqn.mapper;
/**
 * 部门方法
 * @author Administrator
 *
 */

import java.util.List;

import cn.bdqn.pojo.Department;

public interface DepartmentMapper {
	//查询所有部门列表
	public List<Department> queryAllDept();
}
