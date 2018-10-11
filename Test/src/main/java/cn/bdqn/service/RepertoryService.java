package cn.bdqn.service;

import cn.bdqn.pojo.Repertory;
import cn.bdqn.util.PageUtil;

public interface RepertoryService {
	public PageUtil<Repertory> queryRepertory(String laidTime, int unitId, int brandId, int storehouseId, int startRow,
			int pageSize);

	// Ìí¼Ó¿â´æ±í
	public int addRepertory(Repertory repertory);
}
