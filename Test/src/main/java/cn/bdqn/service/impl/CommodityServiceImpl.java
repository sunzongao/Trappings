package cn.bdqn.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.bdqn.mapper.CommodityMapper;
import cn.bdqn.pojo.Commodity;
import cn.bdqn.service.CommodityService;

@Service("commodityService")
public class CommodityServiceImpl implements CommodityService {
	
	@Resource(name="commodityMapper")
	private  CommodityMapper commodityMapper;
	
	@Override
	public List<Commodity> queryCommodityIdAndCName() {
		return commodityMapper.queryCommodityIdAndCName();
	}

	@Override
	public Commodity getCommodityIdByCName(String CommodityId) {
		return commodityMapper.getCommodityIdByCName(CommodityId);
	}

}
