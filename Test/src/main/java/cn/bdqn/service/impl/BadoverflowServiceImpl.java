package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.bdqn.mapper.BadoverflowMapper;
import cn.bdqn.pojo.Badoverflow;
import cn.bdqn.service.BadoverflowService;
import cn.bdqn.util.PageUtil;

@Service("badoverflowService")
public class BadoverflowServiceImpl implements BadoverflowService {

	@Resource(name="badoverflowMapper")
	private BadoverflowMapper badoverflowMapper;	
	
	@Override
	public PageUtil<Badoverflow> queryBadoverflow(int storehouseId, int startRow, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageUtil<Badoverflow> pageUtil = new PageUtil<Badoverflow>();
		map.put("storehouseId", storehouseId);
		int count = badoverflowMapper.count(map);
		pageUtil.setTotalCount(count);
		pageUtil.setPageSize(pageSize);
		pageUtil.setCurrentPage(startRow);
		int pageIndex = pageUtil.getStartRow();
		map.put("startRow", pageIndex);
		map.put("pageSize", pageSize);
		List<Badoverflow> lists = badoverflowMapper.queryBadoverflow(map);
		pageUtil.setLists(lists);
		return pageUtil;
	}

}
