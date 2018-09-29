package cn.bdqn.pojo;

import java.util.List;

public class Role {
	// 角色id
	private int id;
	// 角色名称
	private String rname;
	// 角色名称（英文）
	private String flag;
	// 角色所拥有的权限集合
	private List<Permission> permissions;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	
}
