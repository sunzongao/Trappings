package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Procurement;
import cn.bdqn.pojo.Put;

public interface PutMapper {

	// 分页查询采购单
	public List<Put> queryPut(Map<String, Object> map);

	// 获取记录数
	public int queryCount(Map<String, Object> map);
	
	
	//添加记录
	public int addPut(@Param("procurementId")String procurementId,
			@Param("putTime")String putTime);

}
