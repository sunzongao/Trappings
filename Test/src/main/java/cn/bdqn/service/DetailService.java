package cn.bdqn.service;

import cn.bdqn.pojo.Detail;
import cn.bdqn.util.PageUtil;

public interface DetailService {
	// 添加盘点详细
	public int addDetail(Detail detail);

	// 查询库存详细信息、分页
	public PageUtil<Detail> getByAetailAndCheck(int overflowOrBreakage, int startRow);
}
