package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.aop.IntroductionAdvisor;

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
	
	//删除供应商信息
	public int deleteSupplier(@Param("supplierId")String supplierId);
	
	//新增供应商
	public int addSupplier(Supplier s);
	
	//查询供应商
	public List<Supplier> querySuppliers();

	//查询供应商列表集合
	public List<Supplier> queryByName();

}
