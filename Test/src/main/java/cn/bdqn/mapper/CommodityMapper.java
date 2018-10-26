package cn.bdqn.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Commodity;

public interface CommodityMapper {
	//��������ѯ������Ʒ
	public List<Commodity> queryCommodity(Map<String, Object> map);
	
	//��ѯ��Ʒ��¼��
	public int queryCount(Map<String, Object> map);
	
	// ��ѯ��Ʒ��ı�ź�����
	public List<Commodity> queryCommodityIdAndCName();
	
	//������Ʒ��Ų�ѯ
	public Commodity getCommodityIdByCName(String CommodityId);
	
	//����Ʒ��Ų�ѯ��Ʒ��Ϣ
	public List<Commodity> queryCommodityById(Map<String, Object> map);
	
	
	//������Ʒ��Ż�ȡ��Ʒ��Ϣ
	public Commodity getCommodityById(@Param("commodityId")String commodityId);
	
	
	//�޸���Ʒ��Ϣ
	public int updateCommodity(Commodity c);
	
	
	//ɾ����Ʒ
	public int deleteCommodity(@Param("commodityId")String commodityId);
	
	//������Ʒ
	public int addCommodity(Commodity c);
	
}
