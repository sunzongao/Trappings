package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Badoverflow;

public interface BadoverflowMapper {
	//��ѯ�������
		public List<Badoverflow> queryBadoverflow(Map<String, Object> map);
		//��ѯ����
		public int count(Map<String, Object> map);
		//11
}	
