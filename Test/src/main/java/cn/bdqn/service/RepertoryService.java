package cn.bdqn.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Repertory;
import cn.bdqn.util.PageUtil;

public interface RepertoryService {
	public PageUtil<Repertory> queryRepertory(String laidTime, int unitId, int brandId, int storehouseId, int startRow);

	// 添加库存表
	public int addRepertory(Repertory repertory);

	// 删除库存
	public int deleteRepertoy(String commodityId, int inventory);

	// 根据Id查询属性值
	public Repertory getById(String commodityId);

	// 修改库存
	public int updateRepertory(Repertory repertory);

	// 根据所属仓库查询所有属性值，在库存盘点中显示
	public PageUtil<Repertory> getByStorehouseId(int storehouseId, int startRow);

	// 修改最低库存量
	public int updateRepertoryAllMinimumStock(Repertory repertory);

	// 根据Id和所属仓库查询属性值
	public Repertory getByIdAndStorehouseId(String commodityId, int storehouseId);

	// 库存调拨(减)
	public int updateInventoryAllocation(Repertory repertory);

	// 修改库存的库存量 从报溢出来的数据加入库存量的数据
	public int updateRepertoryInventoryJia(Repertory repertory);

	// 修改库存的库存量 用库存量减去报损出来的数据
	public int updateRepertoryInventoryjian(Repertory repertory);
}
