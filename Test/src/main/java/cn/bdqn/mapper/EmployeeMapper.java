package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Employee;

public interface EmployeeMapper {
	//��ҳ��ѯԱ������ѯ����Ϊ����ģ����ѯ����ְʱ�䷶Χ��ѯ��
	public List<Employee> queryEmployeeByName(Map<String, Object> map);
	//�޸�Ա����Ϣ
	public int updateEmployeeById(@Param("employee") Employee employee);
	//����Ա��idɾ��Ա��
	public int deleteEmployeeById(@Param("employeeId") String employeeId);
	//����Ա��
	public int addEmployee(@Param("employee") Employee employee);
	//��ȡ������ѯ��������
	public int queryCount(Map<String, Object> map);
	//����id���ض���
	public Employee queryById(@Param("employeeId") String employeeId);
}
