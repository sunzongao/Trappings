package cn.bdqn.service;

import cn.bdqn.pojo.Repertory;
import cn.bdqn.util.PageUtil;

public interface RepertoryService {
	public PageUtil<Repertory> queryRepertory(String laidTime, int unitId, int brandId, int storehouseId, int startRow,
			int pageSize);

	// ��ӿ���
	public int addRepertory(Repertory repertory);
}
