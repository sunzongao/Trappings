package cn.bdqn.service;

import cn.bdqn.pojo.Detail;
import cn.bdqn.util.PageUtil;

public interface DetailService {
	// ����̵���ϸ
	public int addDetail(Detail detail);

	// ��ѯ�����ϸ��Ϣ����ҳ
	public PageUtil<Detail> getByAetailAndCheck(int overflowOrBreakage, int startRow);
}
