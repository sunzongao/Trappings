package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Supplier;

public interface SupplierMapper {
	//分页查询供货商（查询条件根据供货商名称查询）
	public List<Supplier> querySupplier(Map<String, Object> map);
	
	//获取记录数
	public int queryCount(Map<String, Object> map);
	
	//根据id获取用户信息
	public Supplier getSupplierById(@Param("supplierId")String supplierId);
	
	//修改供货商信息
	public int updateSupplier(Supplier s);
}
