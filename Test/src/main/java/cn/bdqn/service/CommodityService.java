package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Commodity;

public interface CommodityService {
	// 查询商品表的编号和名称
	public List<Commodity> queryCommodityIdAndCName();

	// 根据商品编号查询商品名称
	public Commodity getCommodityIdByCName(String CommodityId);
}
