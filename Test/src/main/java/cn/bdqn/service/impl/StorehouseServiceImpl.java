package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.StorehouseMapper;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.service.StorehouseService;

@Service
public class StorehouseServiceImpl implements StorehouseService {

	@Autowired
	private StorehouseMapper storehouseMapper;
	

	public List<Storehouse> queryStorehouse() {
		return storehouseMapper.queryStorehouse();
	}

}
