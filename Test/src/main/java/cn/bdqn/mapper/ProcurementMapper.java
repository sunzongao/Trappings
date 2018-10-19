package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Procurement;

/**
 * 
 * @author GCL105659
 *
 */
public interface ProcurementMapper {
	//��ҳ��ѯ�ɹ���
	public List<Procurement> queryProcurement(Map<String, Object> map);
	//��ȡ��¼��
	public int queryCount(Map<String, Object> map);
	//���ݶ�����Ż�ȡ��Ϣ
	public List<Procurement> getProcurementByCode(@Param("procurementId")String procurementId);
}
