package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Detailed;


public interface DetailedService {
		//查看详细
		public List<Detailed> query(String procurementId);
		
		//向采购表中添加采购的商品
		public int addDetailed(String procurementId,
				String commodityId,Integer number,
				Double price);
		
		//移除添加的商品
		public int deleteDetailed(Integer id);
		
		
		//根据id查询采购商品详细
		public Detailed getDetailedById(Integer id);
		
		public int updateDetailed(Integer id,Double price,
				Integer number);
}
