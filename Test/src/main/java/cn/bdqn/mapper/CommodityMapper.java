package cn.bdqn.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Commodity;

public interface CommodityMapper {
	// ��ѯ��Ʒ��ı�ź�����
	public List<Commodity> queryCommodityIdAndCName();
	
	//������Ʒ��Ų�ѯ
	public Commodity getCommodityIdByCName(String CommodityId);
}
