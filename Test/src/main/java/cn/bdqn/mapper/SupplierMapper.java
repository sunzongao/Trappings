package cn.bdqn.mapper;

import java.util.Map;

import com.sun.tools.javac.util.List;

import cn.bdqn.pojo.Supplier;

public interface SupplierMapper {
	public List<Supplier> querySupplier(Map<String, Object> map);
	
	public int count(Map<String, Object> map);
}
