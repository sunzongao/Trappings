package cn.bdqn.service;



import cn.bdqn.pojo.Employee;
import cn.bdqn.util.PageUtil;

public interface EmployeeService {
	//��ҳ��ѯ
	public PageUtil<Employee> queryEmployeeByName(String eName,String begintime,String endtime,int pageindex);
	//����id���ض���
	public Employee queryById(String employeeId);
	//�޸�Ա����Ϣ
	public int updateEmployeeById(Employee employee);
}
