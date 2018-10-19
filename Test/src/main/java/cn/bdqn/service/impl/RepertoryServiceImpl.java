package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.bdqn.mapper.RepertoryMapper;
import cn.bdqn.pojo.Badoverflow;
import cn.bdqn.pojo.Repertory;
import cn.bdqn.service.RepertoryService;
import cn.bdqn.util.PageUtil;

@Service("repertoryService")
public class RepertoryServiceImpl implements RepertoryService {

	@Resource(name = "repertoryMapper")
	private RepertoryMapper repertoryMapper;

	@Override
	public PageUtil<Repertory> queryRepertory(String laidTime, int unitId, 
			int brandId,int storehouseId, int startRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageUtil<Repertory> pageUtil = new PageUtil<Repertory>();
		map.put("laidTime", laidTime);
		map.put("unitId", unitId);
		map.put("storehouseId", storehouseId);
		map.put("brandId", brandId);
		int count = repertoryMapper.count(map);
		pageUtil.setTotalCount(count);
		pageUtil.setCurrentPage(startRow);
		int pageIndex = pageUtil.getStartRow();
		map.put("startRow", pageIndex);
		map.put("pageSize", pageUtil.getPageSize());
		List<Repertory> lists = repertoryMapper.queryRepertory(map);
		pageUtil.setLists(lists);
		return pageUtil;
	}

	//����
	@Override
	public int addRepertory(Repertory repertory) {
		return repertoryMapper.addRepertory(repertory);
	}

	//ɾ��
	@Override
	public int deleteRepertoy(String commodityId) {
		return repertoryMapper.deleteRepertoy(commodityId);
	}

	@Override
	public Repertory getById(String commodityId) {
		return repertoryMapper.getById(commodityId);
	}

	@Override
	public int updateRepertory(Repertory repertory) {
		return repertoryMapper.updateRepertory(repertory);
	}

}
