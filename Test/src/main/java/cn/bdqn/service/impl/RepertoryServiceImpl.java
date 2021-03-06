package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.AllocatedetailedMapper;
import cn.bdqn.mapper.DetailMapper;
import cn.bdqn.mapper.RepertoryMapper;
import cn.bdqn.pojo.Allocatedetailed;
import cn.bdqn.pojo.Badoverflow;
import cn.bdqn.pojo.Detail;
import cn.bdqn.pojo.Repertory;
import cn.bdqn.service.RepertoryService;
import cn.bdqn.util.PageUtil;

@Service("repertoryService")
public class RepertoryServiceImpl implements RepertoryService {

	@Autowired
	private RepertoryMapper repertoryMapper;
	@Autowired
	private AllocatedetailedMapper allocatedetailedMapper;

	@Override
	public PageUtil<Repertory> queryRepertory(String laidTime, int unitId, int brandId, int storehouseId,
			int startRow) {
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

	// 添加
	@Override
	public int addRepertory(Repertory repertory) {
		return repertoryMapper.addRepertory(repertory);
	}

	// 删除
	@Override
	public int deleteRepertoy(String commodityId, int inventory) {
		return repertoryMapper.deleteRepertoy(commodityId, inventory);
	}

	@Override
	public Repertory getById(String commodityId) {
		return repertoryMapper.getById(commodityId);
	}

	@Override
	public int updateRepertory(Repertory repertory) {
		return repertoryMapper.updateRepertory(repertory);
	}

	@Override
	public PageUtil<Repertory> getByStorehouseId(int storehouseId, int startRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageUtil<Repertory> pageUtil = new PageUtil<Repertory>();
		map.put("storehouseId", storehouseId);
		int count = repertoryMapper.count1(map);
		pageUtil.setTotalCount(count);
		pageUtil.setCurrentPage(startRow);
		int pageIndex = pageUtil.getStartRow();
		map.put("startRow", pageIndex);
		map.put("pageSize", pageUtil.getPageSize());
		List<Repertory> lists = repertoryMapper.getByStorehouseId(map);
		pageUtil.setLists(lists);
		return pageUtil;
	}

	@Override
	public int updateRepertoryAllMinimumStock(Repertory repertory) {
		return repertoryMapper.updateRepertoryAllMinimumStock(repertory);
	}

	@Override
	public int updateInventoryAllocation(Repertory repertory) {
		//库存调拨的时候 如果仓库中没有这行数据，就添加一条数据，如果有那就修改修改库存量
		if(repertoryMapper.getByIdAndStorehouseId(repertory.getCommodityId()
				,repertory.getStorehouseId1())==null){
			repertory.setInventory(repertory.getQuantity());
			repertoryMapper.addRepertory(repertory);
		}else {
			repertoryMapper.updateInventoryAllocationJan(repertory);
		}
		return repertoryMapper.updateInventoryAllocation(repertory);
	}

	@Override
	public Repertory getByIdAndStorehouseId(String commodityId, int storehouseId) {
		return repertoryMapper.getByIdAndStorehouseId(commodityId, storehouseId);
	}

	@Override
	public int updateRepertoryInventoryJia(Repertory repertory) {
		return repertoryMapper.updateRepertoryInventoryJia(repertory);
	}

	@Override
	public int updateRepertoryInventoryjian(Repertory repertory) {
		return repertoryMapper.updateRepertoryInventoryjian(repertory);
	}


}
