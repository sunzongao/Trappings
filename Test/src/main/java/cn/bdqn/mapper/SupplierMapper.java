package cn.bdqn.mapper;

import java.util.List;

import cn.bdqn.pojo.Supplier;

public interface SupplierMapper {
	//查询供应商列表集合
	public List<Supplier> queryByName();
}
