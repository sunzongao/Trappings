package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Repertory;

public interface RepertoryMapper {
	//��ѯ�������мӷ�ҳ
	public List<Repertory> queryRepertory(Map<String, Object> map);
	
	//��ѯ��������
	public int count(Map<String , Object> map);
	
	//��ӿ���
	public int addRepertory(Repertory repertory);
}
