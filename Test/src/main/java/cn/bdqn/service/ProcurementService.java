package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Employee;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.util.PageUtil;

public interface ProcurementService {
		//∑÷“≥≤È—Ø
		public PageUtil<Procurement> queryProcurement(String procurementId,Integer condition,String begintime,String endtime,int pageindex);
		public List<Procurement> getProcurementByCode(String procurementId);
}
