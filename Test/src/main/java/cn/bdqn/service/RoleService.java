package cn.bdqn.service;

import java.util.List;


import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.Role;
import cn.bdqn.util.PageUtil;

public interface RoleService {
	//获取素有角色集合
	public List<Role> queryAllRole();

	//根据id获取改用户所拥有的所有角色
	public List<Role> queryAllRoleByUserId(int id);
	
	//查询角色分页查询
	public PageUtil<Role> queryAllBysomething(int pageindex,String rname);
	
	//根据角色id获取该叫色拥有的所有权限
	public List<Permission> queryAllPerByRid(int rid);
	
	//根据角色id获取角色
	public Role queryByid(int id);
	
	//根据角色id删除角色所拥有的权限
	public int deleteperByrid(int rid);
	
	//根据id删除角色
	public int deleteroleById(int id);
	
	//新增角色权限
	public int addRolePer(int rid,int pid);
}
