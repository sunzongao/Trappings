package cn.bdqn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.DetailMapper;
import cn.bdqn.pojo.Check;
import cn.bdqn.pojo.Detail;
import cn.bdqn.service.DetailService;
import cn.bdqn.util.PageUtil;
/**
 *≈Ãµ„œÍœ∏±Ì
 * @author Administrator
 *
 */
@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailMapper detailMapper;

	@Override
	public int addDetail(Detail detail) {
		return detailMapper.addDetail(detail);
	}

	@Override
	public PageUtil<Detail> getByAetailAndCheck(int overflowOrBreakage, int startRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageUtil<Detail> pageUtil = new PageUtil<Detail>();
		map.put("overflowOrBreakage", overflowOrBreakage);
		int count = detailMapper.count(map);
		pageUtil.setTotalCount(count);
		pageUtil.setCurrentPage(startRow);
		int pageIndex = pageUtil.getStartRow();
		map.put("startRow", pageIndex);
		map.put("pageSize", pageUtil.getPageSize());
		List<Detail> lists = detailMapper.getByAetailAndCheck(map);
		pageUtil.setLists(lists);
		return pageUtil;
	}

}
