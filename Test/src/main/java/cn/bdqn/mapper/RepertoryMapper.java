package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Repertory;

public interface RepertoryMapper {
	// ��ѯ�������мӷ�ҳ
	public List<Repertory> queryRepertory(Map<String, Object> map);

	// ��ѯ��������
	public int count(Map<String, Object> map);

	// ��ӿ���
	public int addRepertory(Repertory repertory);

	// ɾ�����
	public int deleteRepertoy(@Param("commodityId") String commodityId, @Param("inventory") int inventory);

	// ����Id��ѯ����ֵ
	public Repertory getById(@Param("commodityId") String commodityId);

	// �޸Ŀ��
	public int updateRepertory(Repertory repertory);

	// ���������ֿ��ѯ��������ֵ���ڿ���̵�����ʾ
	public List<Repertory> getByStorehouseId(Map<String, Object> map);

	// ��ѯ��������
	public int count1(Map<String, Object> map);

	// �޸���Ϳ����
	public int updateRepertoryAllMinimumStock(Repertory repertory);

	// ������(��)
	public int updateInventoryAllocation(Repertory repertory);

	// ������(��)
	public int updateInventoryAllocationJan(Repertory repertory);

	// ����Id�������ֿ��ѯ����ֵ
	public Repertory getByIdAndStorehouseId(@Param("commodityId") String commodityId,
			@Param("storehouseId") int storehouseId);

	// �޸Ŀ��Ŀ���� �ӱ�����������ݼ�������������
	public int updateRepertoryInventoryJia(Repertory repertory);
	
	// �޸Ŀ��Ŀ���� �ÿ������ȥ�������������
	public int updateRepertoryInventoryjian(Repertory repertory);


}
