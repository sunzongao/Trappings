package cn.bdqn.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Supplier;
import cn.bdqn.util.PageUtil;

public interface SupplierService {
	public PageUtil<Supplier> querySupplier(String sName,
			int pageindex);
	
	public Supplier getSupplierById(String supplierId);
	
	public int updateSupplier(Supplier s);
}
