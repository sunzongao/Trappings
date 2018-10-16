package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.User;

public interface UserMapper {
	// ��¼
	public User queryUser(@Param("uname") String uname);

	// ��ѯ��¼�û���ӵ�еĽ�ɫ
	public Set<String> queryRole(@Param("uname") String uname);

	// ��ѯ��¼�û���ӵ�е�Ȩ��
	public Set<String> querypermission(@Param("uname") String uname);
	
	//��ѯ��½�û������е����н�ɫ��Ȩ��
	public List<Permission> queryAllRoleAndPermissions(@Param("uname") String uname);
	
	//��ѯ�����û�(��ҳ�������˺�ģ����ѯ��״̬)
	public List<User> queryAllUser(Map<String, Object> map);
	
	//��ѯ�����û���¼����(��ҳ�������˺�ģ����ѯ��״̬)
	public int queryCount(Map<String, Object> map);
	
	//����id�޸��û�״̬
	public int updateUserStateById(@Param("id") int id,@Param("state") int state);
	
	//�����û�idɾ��ӵ�е����н�ɫ
	public int deleteAllRoleById(@Param("id") int id);
	
	//���û�����Ȩ��
	public int addRoleById(@Param("id")int id, @Param("rid") int rid);
}
