package cn.bdqn.service;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Put;
import cn.bdqn.util.PageUtil;

public interface PutService {
	// ��Ӽ�¼
	public int addPut(String procurementId, String putTime);

}
