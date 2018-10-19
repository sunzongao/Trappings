package cn.bdqn.mapper;

import java.util.List;

import cn.bdqn.pojo.Unit;

/**
 * 商品单位接口
 * @author GCL105659
 *
 */
public interface UnitMapper {
	//查询商品单位表所有
	public List<Unit> queryUnit();
}
