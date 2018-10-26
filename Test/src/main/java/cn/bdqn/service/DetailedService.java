package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Detailed;


public interface DetailedService {
		//�鿴��ϸ
		public List<Detailed> query(String procurementId);
		
		//��ɹ�������Ӳɹ�����Ʒ
		public int addDetailed(String procurementId,
				String commodityId,Integer number,
				Double price);
		
		//�Ƴ���ӵ���Ʒ
		public int deleteDetailed(Integer id);
		
		
		//����id��ѯ�ɹ���Ʒ��ϸ
		public Detailed getDetailedById(Integer id);
		
		public int updateDetailed(Integer id,Double price,
				Integer number);
}
