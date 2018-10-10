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

	public PageUtil<Supplier> querySupplier(String sName, int pageindex) {
		PageUtil<Supplier> pageUtil =new PageUtil<>();
		Map<String, Object> map=new HashMap<>();
		map.put("sName", sName);
		pageUtil.setTotalCount(supplierMapper.queryCount(map));
		pageUtil.setCurrentPage(pageindex);
		map.put("start", pageUtil.getStartRow());
		map.put("end", pageUtil.getPageSize());
		pageUtil.setLists(supplierMapper.querySupplier(map));
		return pageUtil;
	}

	public Supplier getSupplierById(String supplierId) {
		return supplierMapper.getSupplierById(supplierId);
	}

	public int updateSupplier(Supplier s) {
		return supplierMapper.updateSupplier(s);
	}
	


}
