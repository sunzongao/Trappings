package cn.bdqn.service;

import cn.bdqn.pojo.Customer;
import cn.bdqn.util.PageUtil;

public interface CustomerService {
	public PageUtil<Customer>queryAll(String cName,int cId,int currentPage,int pageSize);
	public int add(Customer customer);
}
