package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.AllocatedetailedMapper;
import cn.bdqn.pojo.Allocatedetailed;
import cn.bdqn.pojo.Detail;
import cn.bdqn.service.AllocatedetailedService;
import cn.bdqn.util.PageUtil;

@Service
public class AllocatedetailedServiceImpl implements AllocatedetailedService {

	@Autowired
	private AllocatedetailedMapper allocatedetailedMapper;

	@Override
	public int addAllocatedetailed(Allocatedetailed allocatedetailed) {
		return allocatedetailedMapper.addAllocatedetailed(allocatedetailed);
	}

	@Override
	public PageUtil<Allocatedetailed> queryAllocatedetailed(String allocateTime, int startRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageUtil<Allocatedetailed> pageUtil = new PageUtil<Allocatedetailed>();
		map.put("allocateTime", allocateTime);
		int count = allocatedetailedMapper.count(map);
		pageUtil.setTotalCount(count);
		pageUtil.setCurrentPage(startRow);
		int pageIndex = pageUtil.getStartRow();
		map.put("startRow", pageIndex);
		map.put("pageSize", pageUtil.getPageSize());
		List<Allocatedetailed> lists = allocatedetailedMapper.queryAllocatedetailed(map);
		pageUtil.setLists(lists);
		return pageUtil;
	}

}
