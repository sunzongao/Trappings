package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Procurement;
import cn.bdqn.pojo.Put;

public interface PutMapper {

	// ��ҳ��ѯ�ɹ���
	public List<Put> queryPut(Map<String, Object> map);

	// ��ȡ��¼��
	public int queryCount(Map<String, Object> map);

}
