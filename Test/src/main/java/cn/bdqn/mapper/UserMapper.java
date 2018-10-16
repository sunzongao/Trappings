package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.User;

public interface UserMapper {
	// 登录
	public User queryUser(@Param("uname") String uname);

	// 查询登录用户所拥有的角色
	public Set<String> queryRole(@Param("uname") String uname);

	// 查询登录用户所拥有的权限
	public Set<String> querypermission(@Param("uname") String uname);
	
	//查询登陆用户所用有的所有角色和权限
	public List<Permission> queryAllRoleAndPermissions(@Param("uname") String uname);
	
	//查询所有用户(分页，根据账号模糊查询，状态)
	public List<User> queryAllUser(Map<String, Object> map);
	
	//查询所有用户记录条数(分页，根据账号模糊查询，状态)
	public int queryCount(Map<String, Object> map);
	
	//根据id修改用户状态
	public int updateUserStateById(@Param("id") int id,@Param("state") int state);
	
	//根据用户id删除拥有的所有角色
	public int deleteAllRoleById(@Param("id") int id);
	
	//给用户赋予权限
	public int addRoleById(@Param("id")int id, @Param("rid") int rid);
}
