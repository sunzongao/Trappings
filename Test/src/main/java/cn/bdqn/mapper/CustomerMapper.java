package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Customer;

public interface CustomerMapper {
	public List<Customer>queryAll(Map<String,Object>map);
	public int count(Map<String,Object>map);
	
	
	public int add(Customer customer);  //添加客户信息
	
	public int delete(int customerId);
	
	
	//编辑客户信息
	public Customer updateById(@Param("id")int id);
	
	public int update(Customer customer);
	
	

}
