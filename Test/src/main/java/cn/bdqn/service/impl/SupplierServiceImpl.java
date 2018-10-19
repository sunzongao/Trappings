package cn.bdqn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.bdqn.mapper.SupplierMapper;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.service.SupplierService;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {
	
	@Resource(name="supplierMapper")
	private SupplierMapper supplierMapper;
	
	@Override
	public List<Supplier> queryByName() {
		return supplierMapper.queryByName();
	}

}
