package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Repertory;

public interface RepertoryMapper {
	//查询库存表所有加分页
	public List<Repertory> queryRepertory(Map<String, Object> map);
	
	//查询库存表总数
	public int count(Map<String , Object> map);
	
	//添加库存表
	public int addRepertory(Repertory repertory);
	
	//删除库存
	public int deleteRepertoy(@Param("commodityId")String  commodityId);
	
	//根据Id查询属性值
	public Repertory getById(@Param("commodityId")String  commodityId);
	
	//修改库存
	public int updateRepertory(Repertory repertory);
	
}
