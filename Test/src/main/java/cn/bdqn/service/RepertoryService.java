package cn.bdqn.service;

import cn.bdqn.pojo.Repertory;
import cn.bdqn.util.PageUtil;

public interface RepertoryService {
	public PageUtil<Repertory> queryRepertory(String laidTime, int unitId, int brandId, int storehouseId, int startRow);

	// 添加库存表
	public int addRepertory(Repertory repertory);
	
	//删除库存
	public int deleteRepertoy(String commodityId);
	
	//根据Id查询属性值
	public Repertory getById(String  commodityId);
	
	//修改库存
	public int updateRepertory(Repertory repertory);
}
