package cn.bdqn.mapper;

import java.util.List;

import cn.bdqn.pojo.Permission;

public interface PermissionMapper {
	//获取所有1级权限
	public List<Permission> queryAllPer1();
	
	//获取所有2级权限
	public List<Permission> queryAllPer2();
}
