package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Commodity;

public interface CommodityService {
	// ��ѯ��Ʒ��ı�ź�����
	public List<Commodity> queryCommodityIdAndCName();

	// ������Ʒ��Ų�ѯ��Ʒ����
	public Commodity getCommodityIdByCName(String CommodityId);
}
