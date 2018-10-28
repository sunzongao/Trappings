package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Detail;

/**
 * 盘点详细
 * 
 * @author Administrator
 *
 */
public interface DetailMapper {
	// 添加盘点详细
	public int addDetail(Detail detail);

	// 查询库存详细信息、分页
	public List<Detail> getByAetailAndCheck(Map<String, Object> map);

	// 查询总数
	public int count(Map<String, Object> map);
	
}
