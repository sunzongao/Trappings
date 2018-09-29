package cn.bdqn.service;

import java.util.Map;

import cn.bdqn.pojo.User;

public interface UserService {
	public User queryUser(String name);
	public Map<String, Object> queryRole(String name);
}
