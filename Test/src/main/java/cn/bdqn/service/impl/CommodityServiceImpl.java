package cn.bdqn.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.CommodityMapper;
import cn.bdqn.pojo.Commodity;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.service.CommodityService;
import cn.bdqn.util.PageUtil;

@Service
public class CommodityServiceImpl implements CommodityService {
	
	@Autowired
	private  CommodityMapper commodityMapper;
	
	@Override
	public List<Commodity> queryCommodityIdAndCName() {
		return commodityMapper.queryCommodityIdAndCName();
	}

	@Override
	public Commodity getCommodityIdByCName(String CommodityId) {
		return commodityMapper.getCommodityIdByCName(CommodityId);
	}

	public List<Commodity> queryCommodityById(String commodityId,String supplierId) {
		Map<String, Object> map=new HashMap<>();
		map.put("commodityId",commodityId );
		map.put("supplierId", supplierId);
		List<Commodity> commodities=commodityMapper.queryCommodityById(map);
		return commodities;
	}

	public Commodity getCommodityById(String commodityId) {
		return commodityMapper.getCommodityById(commodityId);
	}

	public PageUtil<Commodity> queryCommodity(String commodityId, Integer genreId, Integer unitId,
			String supplierId, Integer brandId, Integer pageindex) {
		PageUtil<Commodity> pageUtil =new PageUtil<>();
		Map<String, Object> map=new HashMap<>();
		map.put("commodityId", commodityId);
		map.put("genreId", genreId);
		map.put("unitId", unitId);
		map.put("supplierId", supplierId);
		map.put("brandId", brandId);
		pageUtil.setTotalCount(commodityMapper.queryCount(map));
		pageUtil.setCurrentPage(pageindex);
		map.put("start", pageUtil.getStartRow());
		map.put("end", pageUtil.getPageSize());
		pageUtil.setLists(commodityMapper.queryCommodity(map));
		return pageUtil;
	}

	public int updateCommodity(Commodity c) {
		return commodityMapper.updateCommodity(c);
	}

	public int deleteCommodity(String commodityId) {
		return commodityMapper.deleteCommodity(commodityId);
	}

	public int addCommodity(Commodity c) {
		return commodityMapper.addCommodity(c);
	}

	
	

}
