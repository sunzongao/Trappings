package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.PigmentMapper;
import cn.bdqn.pojo.Pigment;
import cn.bdqn.service.PigmentService;

@Service
public class PigmentServiceImpl implements PigmentService {

	@Autowired
	private PigmentMapper PigmentMapper;
	
	public List<Pigment> queryPigment() {
		return PigmentMapper.queryPigment();
	}

}
