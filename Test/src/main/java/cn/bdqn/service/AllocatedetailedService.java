package cn.bdqn.service;

import cn.bdqn.pojo.Allocatedetailed;
import cn.bdqn.util.PageUtil;

public interface AllocatedetailedService {

	// 添加调拨详细的记录
	public int addAllocatedetailed(Allocatedetailed allocatedetailed);

	// 分页显示调拨详细记录
	public PageUtil<Allocatedetailed> queryAllocatedetailed(String allocateTime, 
			int startRow);

}
