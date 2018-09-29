package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.UserMapper;
import cn.bdqn.pojo.User;
import cn.bdqn.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Override
	public User queryUser(String name) {
		return mapper.queryUser(name);
	}

	@Override
	public Map<String, Object> queryRole(String name) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("allRoles", mapper.queryRole(name));
		map.put("allPremission", mapper.querypermission(name));
		return map;
	}

}
