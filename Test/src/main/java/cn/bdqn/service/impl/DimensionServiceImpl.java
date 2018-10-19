package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.DimensionMapper;
import cn.bdqn.pojo.Dimension;
import cn.bdqn.service.DimensionService;

@Service
public class DimensionServiceImpl implements DimensionService {

	@Autowired
	private DimensionMapper dimensionMapper;
	
	public List<Dimension> queryDimension() {
		return dimensionMapper.queryDimension();
	}

}
