package cn.bdqn.service;

import java.util.List;


import cn.bdqn.pojo.Job;

public interface JobService {
	//��ѯ����ְλ����
	public List<Job> queryAllJob();
	//���ݲ���id���Ҷ�Ӧ��ְλ
	public List<Job> queryJobByDepartmentId(int departmentId);
}
