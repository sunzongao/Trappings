package cn.bdqn.mapper;

import java.util.List;

import cn.bdqn.pojo.Permission;

public interface PermissionMapper {
	//��ȡ����1��Ȩ��
	public List<Permission> queryAllPer1();
	
	//��ȡ����2��Ȩ��
	public List<Permission> queryAllPer2();
}
