package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Repertory;
import cn.bdqn.util.PageUtil;

public interface RepertoryService {
	public PageUtil<Repertory> queryRepertory(String laidTime, int unitId, int brandId, int storehouseId, int startRow);

	// ��ӿ���
	public int addRepertory(Repertory repertory);

	// ɾ�����
	public int deleteRepertoy(String commodityId, int inventory);

	// ����Id��ѯ����ֵ
	public Repertory getById(String commodityId);

	// �޸Ŀ��
	public int updateRepertory(Repertory repertory);

	// ���������ֿ��ѯ��������ֵ���ڿ���̵�����ʾ
	public PageUtil<Repertory> getByStorehouseId(int storehouseId, int startRow);

	// �޸���Ϳ����
	public int updateRepertoryAllMinimumStock(Repertory repertory);

	// ����Id�������ֿ��ѯ����ֵ
	public Repertory getByIdAndStorehouseId(String commodityId, int storehouseId);

	// ������(��)
	public int updateInventoryAllocation(Repertory repertory);

	// �޸Ŀ��Ŀ���� �ӱ�����������ݼ�������������
	public int updateRepertoryInventoryJia(Repertory repertory);

	// �޸Ŀ��Ŀ���� �ÿ������ȥ�������������
	public int updateRepertoryInventoryjian(Repertory repertory);
}
