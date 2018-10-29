package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Allocatedetailed;

/**
 * 调拨详细 Mapper
 * @author Administrator
 *
 */
public interface AllocatedetailedMapper {
	
	//添加调拨详细的记录
	public int addAllocatedetailed(Allocatedetailed allocatedetailed);
	
	public List<Allocatedetailed> queryAllocatedetailed(Map<String, Object>map);
	
	public int count(Map<String, Object> map);
	
}
