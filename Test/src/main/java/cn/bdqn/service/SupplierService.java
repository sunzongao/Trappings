package cn.bdqn.service;

import java.util.List;

import cn.bdqn.pojo.Supplier;

public interface SupplierService {
	//查询供应商列表集合
		public List<Supplier> queryByName();
}
