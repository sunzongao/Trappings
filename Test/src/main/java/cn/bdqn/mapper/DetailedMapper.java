package cn.bdqn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Detailed;

/**
 * 采购商品详细表
 * @author GCL105659
 *
 */
public interface DetailedMapper {
	//查看详细
	public List<Detailed> query(@Param("procurementId")String procurementId);
	
	//向采购表中添加采购的商品
	public int addDetailed(@Param("procurementId")String procurementId,
			@Param("commodityId")String commodityId,@Param("number")Integer number,
			@Param("price")Double price);
	
	//移除添加的商品
	public int deleteDetailed(@Param("id")Integer id);
	
	//根据id查询采购商品详细
	public Detailed getDetailedById(@Param("id")Integer id);
	
	public int updateDetailed(@Param("id")Integer id,@Param("price")Double price,
			@Param("number")Integer number);
	
}
