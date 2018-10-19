package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.Role;

public interface RoleMapper {
	// ��ȡ���н�ɫ����
	public List<Role> queryAllRole();

	// ����id��ȡ���û���ӵ�е����н�ɫ
	public List<Role> queryAllRoleByUserId(@Param("id") int id);

	// ��ѯ��ɫ��ҳ��ѯ
	public List<Role> queryAllBysomething(Map<String, Object> map);

	// ��ȡ������ѯ������
	public int queryCount(Map<String, Object> map);

	// ���ݽ�ɫid��ȡ�ý�ɫӵ�е�����Ȩ��
	public List<Permission> queryAllPerByRid(@Param("id") int rid);

	// ���ݽ�ɫid��ȡ��ɫ
	public Role queryByid(@Param("id") int id);

	// ���ݽ�ɫidɾ����ɫ��ӵ�е�Ȩ��
	public int deleteperByrid(@Param("rid") int rid);

	// ����idɾ����ɫ
	public int deleteroleById(@Param("id") int id);

	// ������ɫȨ��
	public int addRolePer(@Param("rid") int rid, @Param("pid") int pid);

	// ���ݽ�ɫ����flag����
	public Role queryByflag(@Param("flag") String flag);

	// ���ݽ�ɫ����rname����
	public int queryByRname(@Param("rname") String rname);
	
	//������ɫ
	public int addrole(@Param("rname") String rname,@Param("flag")String flag);
}
