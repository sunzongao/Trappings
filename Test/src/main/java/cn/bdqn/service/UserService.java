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
	//��ѯ�����û�
	public PageUtil<User> queryAllUser(int pageindex,String uname,String state,int id);
	//����id�޸��û�״̬
	public int updateUserStateById(int id,int state);
	//�����û�idɾ��ӵ�е����н�ɫ
	public int deleteAllRoleById(int id);
	
	//���û�����Ȩ��
	public int addRoleById(int id,int rid);
}
