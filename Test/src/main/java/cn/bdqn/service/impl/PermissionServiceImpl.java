package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.PermissionMapper;
import cn.bdqn.pojo.Permission;
import cn.bdqn.service.PermissionService;
@Service
public class PermissionServiceImpl implements PermissionService {
	@Autowired
	private PermissionMapper permissionMapper;

	@Override
	public List<Permission> queryAllPer1() {
		return permissionMapper.queryAllPer1();
	}

	@Override
	public List<Permission> queryAllPer2() {
		return permissionMapper.queryAllPer2();
	}

}
