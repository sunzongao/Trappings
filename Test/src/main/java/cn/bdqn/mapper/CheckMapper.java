package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Check;

public interface CheckMapper {
	//查询盘点表、分页
	public List<Check> query(Map<String, Object> map);
	//查询盘点表总数
	public int count(Map<String, Object>map);
}
