package cn.bdqn.mapper;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.User;

public interface UserMapper {
	// ��¼
	public User queryUser(@Param("uname") String uname);

	// ��ѯ��¼�û���ӵ�еĽ�ɫ
	public Set<String> queryRole(@Param("uname") String uname);

	// ��ѯ��¼�û���ӵ�е�Ȩ��
	public Set<String> querypermission(@Param("uname") String uname);
}
