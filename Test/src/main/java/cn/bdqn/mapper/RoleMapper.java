package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.Role;

public interface RoleMapper {
	// 获取素有角色集合
	public List<Role> queryAllRole();

	// 根据id获取改用户所拥有的所有角色
	public List<Role> queryAllRoleByUserId(@Param("id") int id);

	// 查询角色分页查询
	public List<Role> queryAllBysomething(Map<String, Object> map);

	// 获取条件查询的条数
	public int queryCount(Map<String, Object> map);

	// 根据角色id获取该叫色拥有的所有权限
	public List<Permission> queryAllPerByRid(@Param("id") int rid);

	// 根据角色id获取角色
	public Role queryByid(@Param("id") int id);

	// 根据角色id删除角色所拥有的权限
	public int deleteperByrid(@Param("rid") int rid);

	// 根据id删除角色
	public int deleteroleById(@Param("id") int id);

	// 新增角色权限
	public int addRolePer(@Param("rid") int rid, @Param("pid") int pid);

	// 根据角色名称flag查重
	public Role queryByflag(@Param("flag") String flag);

	// 根据角色名称rname查重
	public int queryByRname(@Param("rname") String rname);
	
	//新增角色
	public int addrole(@Param("rname") String rname,@Param("flag")String flag);
}
