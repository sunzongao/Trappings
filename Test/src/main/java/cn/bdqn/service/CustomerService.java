package cn.bdqn.service;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Customer;
import cn.bdqn.util.PageUtil;

public interface CustomerService {
	public PageUtil<Customer>queryAll(String cName,int cId,int currentPage,int pageSize);
	public int add(Customer customer);
	
	public int delete(String customerId);
	
	public Customer updateById(@Param("id")String id);
	
	public int update(Customer customer);
}
