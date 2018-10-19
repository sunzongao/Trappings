package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.UnitMapper;
import cn.bdqn.pojo.Unit;
import cn.bdqn.service.UnitService;

@Service
public class UnitServiceImpl implements UnitService {

	@Autowired
	private UnitMapper unitMapper;
	
	public List<Unit> queryUnit() {
		return unitMapper.queryUnit();
	}

}
