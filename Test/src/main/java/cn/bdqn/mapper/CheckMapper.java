package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Check;

public interface CheckMapper {
	//��ѯ�̵����ҳ
	public List<Check> queryCheck(Map<String, Object> map);
	//��ѯ�̵������
	public int count(Map<String, Object>map);
}
