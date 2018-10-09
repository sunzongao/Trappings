package cn.bdqn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.bdqn.mapper.CustomertypeMapper;
import cn.bdqn.pojo.Customertype;
import cn.bdqn.service.CustomertypeService;
@Service("customertypeService")
public class CustomertypeServiceImpl implements CustomertypeService {
	@Resource(name="customertypeMapper")
	private CustomertypeMapper customertypeMapper;
	@Override
	public List<Customertype> query() {
		return customertypeMapper.query();	
	}

}
