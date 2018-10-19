package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import cn.bdqn.pojo.Badoverflow;

public interface BadoverflowMapper {
	//查询报损报溢表
		public List<Badoverflow> queryBadoverflow(Map<String, Object> map);
		//查询总数
		public int count(Map<String, Object> map);
		//11
}	
