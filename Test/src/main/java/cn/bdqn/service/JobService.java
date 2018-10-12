package cn.bdqn.service;

import java.util.List;


import cn.bdqn.pojo.Job;

public interface JobService {
	//查询所有职位集合
	public List<Job> queryAllJob();
	//根据部门id查找对应的职位
	public List<Job> queryJobByDepartmentId(int departmentId);
}
