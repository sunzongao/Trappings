package cn.bdqn.service.impl;

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
	
	public PageUtil<Supplier> querySupplier(Map<String, Object> map) {
		return null;
	}

}
