package cn.bdqn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.bdqn.mapper.StorehouseMapper;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.service.StorehouseService;

@Service("storehouseService")
public class StorehouseServiceImpl implements StorehouseService {
	
	@Resource(name="storehouseMapper")
	private StorehouseMapper storehouseMapper;
	
	@Override
	public List<Storehouse> queryStorehouse() {
		return storehouseMapper.queryStorehouse();
	}

}
