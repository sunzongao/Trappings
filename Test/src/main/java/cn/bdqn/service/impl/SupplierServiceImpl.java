package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.SupplierMapper;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.service.SupplierService;
import cn.bdqn.util.PageUtil;

@Service
public class SupplierServiceImpl implements SupplierService{

	@Autowired
	private SupplierMapper supplierMapper;
	
	public PageUtil<Supplier> querySupplier(String sName,
			int currentPage, int pageSize) {
		PageUtil<Supplier> pageUtil = new PageUtil<Supplier>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sName", sName);
		int totalCount = supplierMapper.count(map);
		pageUtil.setTotalCount(totalCount);
		pageUtil.setPageSize(pageSize);
		pageUtil.setCurrentPage(currentPage);
		int startRow = pageUtil.getStartRow();
		map.put("startRow", startRow);
		map.put("pageSize", pageSize);
		List<Supplier> list = supplierMapper.querySupplier(map);
		pageUtil.setLists(list);
		return pageUtil;
	}


}
