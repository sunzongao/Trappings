package cn.bdqn.service;

import cn.bdqn.pojo.Badoverflow;
import cn.bdqn.util.PageUtil;

public interface BadoverflowService {
	public PageUtil<Badoverflow>queryBadoverflow(int storehouseId,int startRow,int pageSize);
}
