package cn.bdqn.service;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Put;
import cn.bdqn.util.PageUtil;

public interface PutService {
	// Ìí¼Ó¼ÇÂ¼
	public int addPut(String procurementId, String putTime);

}
