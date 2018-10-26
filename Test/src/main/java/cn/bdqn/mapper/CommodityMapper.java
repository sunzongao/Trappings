package cn.bdqn.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Commodity;

public interface CommodityMapper {
	//按条件查询所有商品
	public List<Commodity> queryCommodity(Map<String, Object> map);
	
	//查询商品记录数
	public int queryCount(Map<String, Object> map);
	
	// 查询商品表的编号和名称
	public List<Commodity> queryCommodityIdAndCName();
	
	//根据商品编号查询
	public Commodity getCommodityIdByCName(String CommodityId);
	
	//按商品编号查询商品信息
	public List<Commodity> queryCommodityById(Map<String, Object> map);
	
	
	//根据商品编号获取商品信息
	public Commodity getCommodityById(@Param("commodityId")String commodityId);
	
	
	//修改商品信息
	public int updateCommodity(Commodity c);
	
	
	//删除商品
	public int deleteCommodity(@Param("commodityId")String commodityId);
	
	//新增商品
	public int addCommodity(Commodity c);
	
}
