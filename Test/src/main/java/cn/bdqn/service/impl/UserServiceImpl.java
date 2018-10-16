package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.UserMapper;
import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.User;
import cn.bdqn.service.UserService;
import cn.bdqn.util.PageUtil;
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

	@Override
	public List<Permission> queryAllRoleAndPermissions(String name) {
		return mapper.queryAllRoleAndPermissions(name);
	}

	@Override
	public PageUtil<User> queryAllUser(int pageindex,String uname,String state,int id) {
		PageUtil<User> util=new PageUtil<>();
		Map<String, Object> map=new HashMap<>();
		map.put("uname", uname);
		map.put("state", state);
		map.put("id", id);
		util.setTotalCount(mapper.queryCount(map));
		util.setCurrentPage(pageindex);
		map.put("start", util.getStartRow());
		map.put("end", util.getPageSize());
		util.setLists(mapper.queryAllUser(map));
		return util;
	}

	@Override
	public int updateUserStateById(int id, int state) {
		return mapper.updateUserStateById(id, state);
	}

	@Override
	public int deleteAllRoleById(int id) {
		return mapper.deleteAllRoleById(id);
	}

	@Override
	public int addRoleById(int id, int rid) {
		return mapper.addRoleById(id, rid);
	}

}
