package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Employee;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.util.PageUtil;

public interface ProcurementService {
		//��ҳ��ѯ
		public PageUtil<Procurement> queryProcurement(String procurementId,Integer condition,String begintime,String endtime,int pageindex);
		public List<Procurement> getProcurementByCode(String procurementId);
		//�����ɹ���
		public int addProcurement(Procurement p);
		
		//�޸Ĳɹ�����Ϣ
		public int updateProcurement(Procurement p);
		
		//�޸�״̬
		public int update(Procurement p);
		
		//���ݶ�����Ż�ȡ����
		public List<Procurement> getProcurementById(@Param("procurementId")String procurementId);
}
