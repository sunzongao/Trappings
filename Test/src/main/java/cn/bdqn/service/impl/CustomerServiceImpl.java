package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.bdqn.mapper.CustomerMapper;
import cn.bdqn.pojo.Customer;
import cn.bdqn.service.CustomerService;
import cn.bdqn.util.PageUtil;
@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
	
	@Resource(name="customerMapper")
	private CustomerMapper customerMapper;

	@Override
	public PageUtil<Customer> queryAll(String cName, int cId, int currentPage, int pageSize) {
		Map<String,Object>map = new HashMap<String, Object>();
		PageUtil<Customer>pageUtil = new PageUtil<Customer>();
		map.put("cName", cName);
		map.put("cId", cId);
		int totalCount = customerMapper.count(map);
		pageUtil.setTotalCount(totalCount);
		pageUtil.setPageSize(pageSize);
		pageUtil.setCurrentPage(currentPage);
		int startRow = pageUtil.getStartRow();
		map.put("startRow", startRow);
		map.put("pageSize", pageSize);
		List<Customer>lists = customerMapper.queryAll(map);
		pageUtil.setLists(lists);
		return pageUtil;
	}

	@Override
	public int add(Customer customer) {
		return customerMapper.add(customer);
	}

}
