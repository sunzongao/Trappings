package cn.bdqn.service;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Role;
import cn.bdqn.pojo.User;

public interface UserService {
	public User queryUser(String name);
	public Map<String, Object> queryRole(String name);
	public List<Role> queryAllRoleAndPermissions(String name);
}
