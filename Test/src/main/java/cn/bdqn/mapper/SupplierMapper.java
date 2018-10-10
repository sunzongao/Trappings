package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Supplier;

public interface SupplierMapper {
	//��ҳ��ѯ�����̣���ѯ�������ݹ��������Ʋ�ѯ��
	public List<Supplier> querySupplier(Map<String, Object> map);
	
	//��ȡ��¼��
	public int queryCount(Map<String, Object> map);
	
	//����id��ȡ�û���Ϣ
	public Supplier getSupplierById(@Param("supplierId")String supplierId);
	
	//�޸Ĺ�������Ϣ
	public int updateSupplier(Supplier s);
}
