package cn.bdqn.service;





import cn.bdqn.pojo.Employee;
import cn.bdqn.util.PageUtil;

public interface EmployeeService {
	//分页查询
	public PageUtil<Employee> queryEmployeeByName(String eName,String begintime,String endtime,int pageindex);
	//根据id返回对象
	public Employee queryById(String employeeId);
	//修改员工信息
	public int updateEmployeeById(Employee employee);
	//根据员工id删除员工
	public int deleteEmployeeById(String employeeId);
	//新增员工
	public int addEmployee(Employee employee);
}
