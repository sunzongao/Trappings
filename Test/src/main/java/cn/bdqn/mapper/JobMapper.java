package cn.bdqn.mapper;

import java.util.List;

import cn.bdqn.pojo.Job;

public interface JobMapper {
	//查询所有职位集合
	public List<Job> queryAllJob();
}
