package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Repertory;

public interface RepertoryMapper {
	//��ѯ�������мӷ�ҳ
	public List<Repertory> queryRepertory(Map<String, Object> map);
	
	//��ѯ��������
	public int count(Map<String , Object> map);
	
	//��ӿ���
	public int addRepertory(Repertory repertory);
	
	//ɾ�����
	public int deleteRepertoy(@Param("commodityId")String  commodityId);
	
	//����Id��ѯ����ֵ
	public Repertory getById(@Param("commodityId")String  commodityId);
	
	//�޸Ŀ��
	public int updateRepertory(Repertory repertory);
	
}
