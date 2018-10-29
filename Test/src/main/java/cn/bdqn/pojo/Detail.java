package cn.bdqn.pojo;

/**
 * 盘点详细表
 * 
 * @author Administrator
 *
 */
public class Detail {

	private String commodityId; //商品编号
	private String detailCName; // 商品名称(自定义)
	private int unitId;// 商品单位
	private int brandId;// 商品品牌
	private int inventoryGap;// 盘点差距
	private int overflowOrBreakage;// 报损或报溢
	private int userId; // 上报人Id
	private String checkId; // 盘点编号
	private int storehouseId;// 所属仓库Id
	private String detailBName; // 商品品牌(自定义)
	private String detailUSurName; // 用户名称(自定义)
	private String detailUName; // 商品单位(自定义)
	private String detailStoName; // 所属仓库（自定义）
	private int detailInventory;  //库存量（自定义）

	
	public int getDetailInventory() {
		return detailInventory;
	}
	public void setDetailInventory(int detailInventory) {
		this.detailInventory = detailInventory;
	}
	public String getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public String getDetailCName() {
		return detailCName;
	}
	public void setDetailCName(String detailCName) {
		this.detailCName = detailCName;
	}
	public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public int getInventoryGap() {
		return inventoryGap;
	}
	public void setInventoryGap(int inventoryGap) {
		this.inventoryGap = inventoryGap;
	}
	public int getOverflowOrBreakage() {
		return overflowOrBreakage;
	}
	public void setOverflowOrBreakage(int overflowOrBreakage) {
		this.overflowOrBreakage = overflowOrBreakage;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getCheckId() {
		return checkId;
	}
	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}
	public int getStorehouseId() {
		return storehouseId;
	}
	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}
	public String getDetailBName() {
		return detailBName;
	}
	public void setDetailBName(String detailBName) {
		this.detailBName = detailBName;
	}
	public String getDetailUSurName() {
		return detailUSurName;
	}
	public void setDetailUSurName(String detailUSurName) {
		this.detailUSurName = detailUSurName;
	}
	public String getDetailUName() {
		return detailUName;
	}
	public void setDetailUName(String detailUName) {
		this.detailUName = detailUName;
	}
	public String getDetailStoName() {
		return detailStoName;
	}
	public void setDetailStoName(String detailStoName) {
		this.detailStoName = detailStoName;
	}
	
	public Detail(String commodityId, String detailCName, int unitId, int brandId, int inventoryGap,
			int overflowOrBreakage, int userId, String checkId, int storehouseId, String detailBName,
			String detailUSurName, String detailUName, String detailStoName, int detailInventory) {
		super();
		this.commodityId = commodityId;
		this.detailCName = detailCName;
		this.unitId = unitId;
		this.brandId = brandId;
		this.inventoryGap = inventoryGap;
		this.overflowOrBreakage = overflowOrBreakage;
		this.userId = userId;
		this.checkId = checkId;
		this.storehouseId = storehouseId;
		this.detailBName = detailBName;
		this.detailUSurName = detailUSurName;
		this.detailUName = detailUName;
		this.detailStoName = detailStoName;
		this.detailInventory = detailInventory;
	}
	public Detail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	

}
