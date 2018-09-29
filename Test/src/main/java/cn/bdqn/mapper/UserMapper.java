package cn.bdqn.mapper;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.User;

public interface UserMapper {
	// 登录
	public User queryUser(@Param("uname") String uname);

	// 查询登录用户所拥有的角色
	public Set<String> queryRole(@Param("uname") String uname);

	// 查询登录用户所拥有的权限
	public Set<String> querypermission(@Param("uname") String uname);
}
