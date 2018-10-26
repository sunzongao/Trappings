package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Employee;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.util.PageUtil;

public interface ProcurementService {
		//分页查询
		public PageUtil<Procurement> queryProcurement(String procurementId,Integer condition,String begintime,String endtime,int pageindex);
		public List<Procurement> getProcurementByCode(String procurementId);
		//创建采购单
		public int addProcurement(Procurement p);
		
		//修改采购单信息
		public int updateProcurement(Procurement p);
		
		//修改状态
		public int update(Procurement p);
		
		//根据订单编号获取对象
		public List<Procurement> getProcurementById(@Param("procurementId")String procurementId);
}
