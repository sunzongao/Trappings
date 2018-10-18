package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.RoleMapper;
import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.Role;
import cn.bdqn.service.RoleService;
import cn.bdqn.util.PageUtil;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Override
	public List<Role> queryAllRole() {
		return roleMapper.queryAllRole();
	}
	@Override
	public List<Role> queryAllRoleByUserId(int id) {
		return roleMapper.queryAllRoleByUserId(id);
	}
	@Override
	public PageUtil<Role> queryAllBysomething(int pageindex, String rname) {
		PageUtil<Role> util=new PageUtil<>();
		Map<String, Object> map=new HashMap<>();
		map.put("rname", rname);
		util.setTotalCount(roleMapper.queryCount(map));
		util.setCurrentPage(pageindex);
		map.put("start", util.getStartRow());
		map.put("end", util.getPageSize());
		util.setLists(roleMapper.queryAllBysomething(map));
		return util;
	}
	@Override
	public List<Permission> queryAllPerByRid(int rid) {
		return roleMapper.queryAllPerByRid(rid);
	}
	@Override
	public Role queryByid(int id) {
		return roleMapper.queryByid(id);
	}
	@Override
	public int deleteperByrid(int rid) {
		return roleMapper.deleteperByrid(rid);
	}
	@Override
	public int deleteroleById(int id) {
		return roleMapper.deleteroleById(id);
	}
	@Override
	public int addRolePer(int rid, int pid) {
		return roleMapper.addRolePer(rid, pid);
	}
	@Override
	public Role queryByflag(String flag) {
		return roleMapper.queryByflag(flag);
	}
	@Override
	public int queryByRname(String rname) {
		return roleMapper.queryByRname(rname);
	}
	@Override
	public int addrole(String rname, String flag) {
		return roleMapper.addrole(rname, flag);
	}

}
