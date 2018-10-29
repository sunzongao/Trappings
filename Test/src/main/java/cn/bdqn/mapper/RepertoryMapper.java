package cn.bdqn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.bdqn.pojo.Repertory;

public interface RepertoryMapper {
	// 查询库存表所有加分页
	public List<Repertory> queryRepertory(Map<String, Object> map);

	// 查询库存表总数
	public int count(Map<String, Object> map);

	// 添加库存表
	public int addRepertory(Repertory repertory);

	// 删除库存
	public int deleteRepertoy(@Param("commodityId") String commodityId, @Param("inventory") int inventory);

	// 根据Id查询属性值
	public Repertory getById(@Param("commodityId") String commodityId);

	// 修改库存
	public int updateRepertory(Repertory repertory);

	// 根据所属仓库查询所有属性值，在库存盘点中显示
	public List<Repertory> getByStorehouseId(Map<String, Object> map);

	// 查询库存表总数
	public int count1(Map<String, Object> map);

	// 修改最低库存量
	public int updateRepertoryAllMinimumStock(Repertory repertory);

	// 库存调拨(减)
	public int updateInventoryAllocation(Repertory repertory);

	// 库存调拨(加)
	public int updateInventoryAllocationJan(Repertory repertory);

	// 根据Id和所属仓库查询属性值
	public Repertory getByIdAndStorehouseId(@Param("commodityId") String commodityId,
			@Param("storehouseId") int storehouseId);

	// 修改库存的库存量 从报溢出来的数据加入库存量的数据
	public int updateRepertoryInventoryJia(Repertory repertory);
	
	// 修改库存的库存量 用库存量减去报损出来的数据
	public int updateRepertoryInventoryjian(Repertory repertory);


}
