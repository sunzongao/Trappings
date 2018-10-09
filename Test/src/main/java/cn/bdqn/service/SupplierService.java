package cn.bdqn.service;

import java.util.Map;

import cn.bdqn.pojo.Supplier;
import cn.bdqn.util.PageUtil;

public interface SupplierService {
	public PageUtil<Supplier> querySupplier(Map<String, Object> map);
}
