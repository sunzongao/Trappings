package cn.bdqn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Detailed;

/**
 * �ɹ���Ʒ��ϸ��
 * @author GCL105659
 *
 */
public interface DetailedMapper {
	//�鿴��ϸ
	public List<Detailed> query(@Param("procurementId")String procurementId);
	
	//��ɹ�������Ӳɹ�����Ʒ
	public int addDetailed(@Param("procurementId")String procurementId,
			@Param("commodityId")String commodityId,@Param("number")Integer number,
			@Param("price")Double price);
	
	//�Ƴ���ӵ���Ʒ
	public int deleteDetailed(@Param("id")Integer id);
	
	//����id��ѯ�ɹ���Ʒ��ϸ
	public Detailed getDetailedById(@Param("id")Integer id);
	
	public int updateDetailed(@Param("id")Integer id,@Param("price")Double price,
			@Param("number")Integer number);
	
}
