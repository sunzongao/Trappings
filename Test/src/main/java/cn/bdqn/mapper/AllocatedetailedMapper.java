package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Allocatedetailed;

/**
 * ������ϸ Mapper
 * @author Administrator
 *
 */
public interface AllocatedetailedMapper {
	
	//��ӵ�����ϸ�ļ�¼
	public int addAllocatedetailed(Allocatedetailed allocatedetailed);
	
	public List<Allocatedetailed> queryAllocatedetailed(Map<String, Object>map);
	
	public int count(Map<String, Object> map);
	
}
