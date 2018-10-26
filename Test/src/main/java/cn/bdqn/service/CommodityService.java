package cn.bdqn.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Commodity;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.util.PageUtil;

public interface CommodityService {
	// 分页查询
	public PageUtil<Commodity> queryCommodity(String commodityId, Integer genreId, Integer unitId, String supplierId,
			Integer brandId, Integer pageindex);

	// 查询商品表的编号和名称
	public List<Commodity> queryCommodityIdAndCName();

	// 根据商品编号查询商品名称
	public Commodity getCommodityIdByCName(String CommodityId);

	// 按商品编号查询商品信息
	public List<Commodity> queryCommodityById(String commodityId, String supplierId);

	// 根据商品编号获取商品信息
	public Commodity getCommodityById(String commodityId);

	// 修改商品信息
	public int updateCommodity(Commodity c);

	// 删除商品
	public int deleteCommodity(String commodityId);

	// 新增商品
	public int addCommodity(Commodity c);
}
