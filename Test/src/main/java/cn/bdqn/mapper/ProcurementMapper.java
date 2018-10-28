package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Procurement;

/**
 * 
 * @author GCL105659
 *
 */
public interface ProcurementMapper {
	//分页查询采购单
	public List<Procurement> queryProcurement(Map<String, Object> map);
	//获取记录数
	public int queryCount(Map<String, Object> map);
	//根据订单编号获取信息
	public List<Procurement> getProcurementByCode(@Param("procurementId")String procurementId);
	//创建采购单
	public int addProcurement(Procurement p);
	//修改采购单信息
	public int updateProcurement(Procurement p);
	//修改状态
	public int update(Procurement p);
	
	//修改签收状态
	public int updateSign(Procurement p);
	
	//根据订单编号获取对象
	public List<Procurement> getProcurementById(@Param("procurementId")String procurementId);
}
