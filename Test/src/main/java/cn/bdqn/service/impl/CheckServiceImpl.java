package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.CheckMapper;
import cn.bdqn.pojo.Check;
import cn.bdqn.service.CheckService;
import cn.bdqn.util.PageUtil;

@Service
public class CheckServiceImpl implements CheckService {

	@Autowired
	private CheckMapper checkMapper;
	
	@Override
	public int addCheck(Check check) {
		return checkMapper.addCheck(check);
	}


}
