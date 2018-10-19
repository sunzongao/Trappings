package cn.bdqn.service;

import java.util.List;


import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.Role;
import cn.bdqn.util.PageUtil;

public interface RoleService {
	//��ȡ���н�ɫ����
	public List<Role> queryAllRole();

	//����id��ȡ���û���ӵ�е����н�ɫ
	public List<Role> queryAllRoleByUserId(int id);
	
	//��ѯ��ɫ��ҳ��ѯ
	public PageUtil<Role> queryAllBysomething(int pageindex,String rname);
	
	//���ݽ�ɫid��ȡ�ý�ɫӵ�е�����Ȩ��
	public List<Permission> queryAllPerByRid(int rid);
	
	//���ݽ�ɫid��ȡ��ɫ
	public Role queryByid(int id);
	
	//���ݽ�ɫidɾ����ɫ��ӵ�е�Ȩ��
	public int deleteperByrid(int rid);
	
	//����idɾ����ɫ
	public int deleteroleById(int id);
	
	//������ɫȨ��
	public int addRolePer(int rid,int pid);
	// ���ݽ�ɫ����flag����
	public Role queryByflag(String flag);

	// ���ݽ�ɫ����rname����
	public int queryByRname(String rname);
	
	//������ɫ
	public int addrole(String rname,String flag);
}
