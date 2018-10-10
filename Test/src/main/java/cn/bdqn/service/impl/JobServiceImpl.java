package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.JobMapper;
import cn.bdqn.pojo.Job;
import cn.bdqn.service.JobService;
@Service
public class JobServiceImpl implements JobService {
	@Autowired
	private JobMapper jobMapper;
	@Override
	public List<Job> queryAllJob() {
		return jobMapper.queryAllJob();
	}

}
