package cn.bdqn.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.PutMapper;
import cn.bdqn.service.PutService;

@Service
public class PutServiceImpl implements PutService{
	
	
	@Autowired
	private PutMapper putMapper;

	public int addPut(String procurementId, String putTime) {
		return putMapper.addPut(procurementId, putTime);
	}
	
	
	
	
}
