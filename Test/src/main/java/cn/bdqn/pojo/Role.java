package cn.bdqn.pojo;

import java.util.List;

public class Role {
	// ��ɫid
	private int id;
	// ��ɫ����
	private String rname;
	// ��ɫ���ƣ�Ӣ�ģ�
	private String flag;
	// ��ɫ��ӵ�е�Ȩ�޼���
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
