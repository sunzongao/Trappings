package cn.bdqn.service;

import java.util.List;



import cn.bdqn.pojo.Supplier;
import cn.bdqn.util.PageUtil;

public interface SupplierService {
	public PageUtil<Supplier> querySupplier(String sName,
			int pageindex);
	
	public Supplier getSupplierById(String supplierId);
	
	public int updateSupplier(Supplier s);
	
	public int deleteSupplier(String supplierId);
	
	public int addSupplier(Supplier s);
	
	public List<Supplier> querySuppliers();

	public List<Supplier> queryByName();

}
