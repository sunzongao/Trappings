package cn.bdqn.pojo;

/**
 * 库存表
 * 
 * @author Administrator
 * 
 */
public class Repertory {
	private String commodityId; // 商品编号 外键关联商品表
	private String repertoryCName; // 商品名称(自定义)
	private int inventory; // 库存量
	private int unitId; // 单位id 外键关联单位表
	private int brandId; // 品牌编号 外键关联品牌表
	private String supplierId; // 供应商编号 外键关联供应商表
	private String laidTime; // 入库时间
	private int storehouseId; // 所属仓库Id 外键关联仓库表
	private String repertoryUName; //单位Name（自定义）
	private String repertoryBName;  //品牌Name（自定义）
	private String repertorySeName;  //所属仓库Name(自定义)
	private String repertorySName;	//供应商(自定义)
	private int minimumStock;   //最低库存 
	private int quantity;  
	private int storehouseId1; //调往仓库
	private int inventoryGap;  //盘点的差距
	
	
	
	public int getInventoryGap() {
		return inventoryGap;
	}
	public void setInventoryGap(int inventoryGap) {
		this.inventoryGap = inventoryGap;
	}
	public int getStorehouseId1() {
		return storehouseId1;
	}
	public void setStorehouseId1(int storehouseId1) {
		this.storehouseId1 = storehouseId1;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public String getRepertoryCName() {
		return repertoryCName;
	}
	public void setRepertoryCName(String repertoryCName) {
		this.repertoryCName = repertoryCName;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
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
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getLaidTime() {
		return laidTime;
	}
	public void setLaidTime(String laidTime) {
		this.laidTime = laidTime;
	}
	public int getStorehouseId() {
		return storehouseId;
	}
	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}
	public String getRepertoryUName() {
		return repertoryUName;
	}
	public void setRepertoryUName(String repertoryUName) {
		this.repertoryUName = repertoryUName;
	}
	public String getRepertoryBName() {
		return repertoryBName;
	}
	public void setRepertoryBName(String repertoryBName) {
		this.repertoryBName = repertoryBName;
	}
	public String getRepertorySeName() {
		return repertorySeName;
	}
	public void setRepertorySeName(String repertorySeName) {
		this.repertorySeName = repertorySeName;
	}
	public String getRepertorySName() {
		return repertorySName;
	}
	public void setRepertorySName(String repertorySName) {
		this.repertorySName = repertorySName;
	}
	public int getMinimumStock() {
		return minimumStock;
	}
	public void setMinimumStock(int minimumStock) {
		this.minimumStock = minimumStock;
	}
	
	
	public Repertory(String commodityId, String repertoryCName, int inventory, int unitId, int brandId,
			String supplierId, String laidTime, int storehouseId, String repertoryUName, String repertoryBName,
			String repertorySeName, String repertorySName, int minimumStock, int quantity, int storehouseId1,
			int inventoryGap) {
		super();
		this.commodityId = commodityId;
		this.repertoryCName = repertoryCName;
		this.inventory = inventory;
		this.unitId = unitId;
		this.brandId = brandId;
		this.supplierId = supplierId;
		this.laidTime = laidTime;
		this.storehouseId = storehouseId;
		this.repertoryUName = repertoryUName;
		this.repertoryBName = repertoryBName;
		this.repertorySeName = repertorySeName;
		this.repertorySName = repertorySName;
		this.minimumStock = minimumStock;
		this.quantity = quantity;
		this.storehouseId1 = storehouseId1;
		this.inventoryGap = inventoryGap;
	}
	public Repertory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
