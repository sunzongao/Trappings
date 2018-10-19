package cn.bdqn.service;

import cn.bdqn.pojo.Repertory;
import cn.bdqn.util.PageUtil;

public interface RepertoryService {
	public PageUtil<Repertory> queryRepertory(String laidTime, int unitId, int brandId, int storehouseId, int startRow);

	// ��ӿ���
	public int addRepertory(Repertory repertory);
	
	//ɾ�����
	public int deleteRepertoy(String commodityId);
	
	//����Id��ѯ����ֵ
	public Repertory getById(String  commodityId);
	
	//�޸Ŀ��
	public int updateRepertory(Repertory repertory);
}
