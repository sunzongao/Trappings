package cn.bdqn.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.TransfersrecordsMapper;
import cn.bdqn.pojo.Transfersrecords;
import cn.bdqn.service.TransfersrecordsService;

@Service
public class TransfersrecordsServiceImpl implements TransfersrecordsService {

	@Autowired
	private TransfersrecordsMapper transfersrecordsMapper;
	
	@Override
	public int addTransfersrecords(Transfersrecords transfersrecords) {
		return transfersrecordsMapper.addTransfersrecords(transfersrecords);
	}

}
