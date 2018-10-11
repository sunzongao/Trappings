package cn.bdqn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Job;

public interface JobMapper {
	//查询所有职位集合
	public List<Job> queryAllJob();
	//根据部门id查找对应的职位
	public List<Job> queryJobByDepartmentId(@Param("departmentId")int departmentId);
}
