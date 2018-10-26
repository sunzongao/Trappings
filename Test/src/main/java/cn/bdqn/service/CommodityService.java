package cn.bdqn.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Commodity;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.util.PageUtil;

public interface CommodityService {
	// ��ҳ��ѯ
	public PageUtil<Commodity> queryCommodity(String commodityId, Integer genreId, Integer unitId, String supplierId,
			Integer brandId, Integer pageindex);

	// ��ѯ��Ʒ��ı�ź�����
	public List<Commodity> queryCommodityIdAndCName();

	// ������Ʒ��Ų�ѯ��Ʒ����
	public Commodity getCommodityIdByCName(String CommodityId);

	// ����Ʒ��Ų�ѯ��Ʒ��Ϣ
	public List<Commodity> queryCommodityById(String commodityId, String supplierId);

	// ������Ʒ��Ż�ȡ��Ʒ��Ϣ
	public Commodity getCommodityById(String commodityId);

	// �޸���Ʒ��Ϣ
	public int updateCommodity(Commodity c);

	// ɾ����Ʒ
	public int deleteCommodity(String commodityId);

	// ������Ʒ
	public int addCommodity(Commodity c);
}
