package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Detail;

/**
 * �̵���ϸ
 * 
 * @author Administrator
 *
 */
public interface DetailMapper {
	// ����̵���ϸ
	public int addDetail(Detail detail);

	// ��ѯ�����ϸ��Ϣ����ҳ
	public List<Detail> getByAetailAndCheck(Map<String, Object> map);

	// ��ѯ����
	public int count(Map<String, Object> map);
	
}
