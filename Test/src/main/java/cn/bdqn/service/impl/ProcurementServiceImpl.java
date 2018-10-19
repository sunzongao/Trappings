package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.ProcurementMapper;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.service.ProcurementService;
import cn.bdqn.util.PageUtil;

@Service
public class ProcurementServiceImpl implements ProcurementService{
	
	@Autowired
	private ProcurementMapper procurementMapper;
	
	
	public PageUtil<Procurement> queryProcurement(String procurementId, Integer condition, String begintime,
			String endtime, int pageindex) {
		PageUtil<Procurement> pageUtil =new PageUtil<>();
		Map<String, Object> map=new HashMap<>();
		map.put("procurementId", procurementId);
		map.put("condition", condition);
		map.put("begintime", begintime);
		map.put("endtime", endtime);
		pageUtil.setTotalCount(procurementMapper.queryCount(map));
		pageUtil.setCurrentPage(pageindex);
		map.put("start", pageUtil.getStartRow());
		map.put("end", pageUtil.getPageSize());
		pageUtil.setLists(procurementMapper.queryProcurement(map));
		return pageUtil;
	}


	public List<Procurement> getProcurementByCode(String procurementId) {
		return procurementMapper.getProcurementByCode(procurementId);
	}

}
