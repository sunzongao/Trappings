package cn.bdqn.service;

import java.util.List;
import java.util.Map;


import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.User;
import cn.bdqn.util.PageUtil;

public interface UserService {
	public User queryUser(String name);
	public Map<String, Object> queryRole(String name);
	public List<Permission> queryAllRoleAndPermissions(String name);
	//查询所有用户
	public PageUtil<User> queryAllUser(int pageindex,String uname,String state,int id);
	//根据id修改用户状态
	public int updateUserStateById(int id,int state);
	//根据用户id删除拥有的所有角色
	public int deleteAllRoleById(int id);
	
	//给用户赋予权限
	public int addRoleById(int id,int rid);
}
