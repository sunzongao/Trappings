package cn.bdqn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Job;

public interface JobMapper {
	//��ѯ����ְλ����
	public List<Job> queryAllJob();
	//���ݲ���id���Ҷ�Ӧ��ְλ
	public List<Job> queryJobByDepartmentId(@Param("departmentId")int departmentId);
}
