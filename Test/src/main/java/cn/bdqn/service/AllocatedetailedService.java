package cn.bdqn.service;

import cn.bdqn.pojo.Allocatedetailed;
import cn.bdqn.util.PageUtil;

public interface AllocatedetailedService {

	// ��ӵ�����ϸ�ļ�¼
	public int addAllocatedetailed(Allocatedetailed allocatedetailed);

	// ��ҳ��ʾ������ϸ��¼
	public PageUtil<Allocatedetailed> queryAllocatedetailed(String allocateTime, 
			int startRow);

}
