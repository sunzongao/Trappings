package cn.bdqn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Result;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.UnitMapper;
import cn.bdqn.pojo.Unit;
import cn.bdqn.service.UnitService;

@Service("unitService")
public class UnitServiceImpl implements UnitService {

	@Resource(name="unitMapper")
	private UnitMapper unitMapper;
	
	@Override
	public List<Unit> queryUnit() {
		return unitMapper.queryUnit();
	}

}
