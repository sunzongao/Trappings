package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Employee;

public interface EmployeeMapper {
	//分页查询员工（查询条件为姓名模糊查询，入职时间范围查询）
	public List<Employee> queryEmployeeByName(Map<String, Object> map);
	//修改员工信息
	public int updateEmployeeById(@Param("employee") Employee employee);
	//根据员工id删除员工
	public int deleteEmployeeById(@Param("employeeId") String employeeId);
	//新增员工
	public int addEmployee(@Param("employee") Employee employee);
	//获取条件查询数据总数
	public int queryCount(Map<String, Object> map);
	//根据id返回对象
	public Employee queryById(@Param("employeeId") String employeeId);
}
