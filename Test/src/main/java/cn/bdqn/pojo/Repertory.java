package cn.bdqn.pojo;

/**
 * 库存表
 * 
 * @author Administrator
 * 
 */
public class Repertory {
	private String commodityId; // 商品编号 外键关联商品表
	private String cName; // 商品名称
	private int inventory; // 库存量
	private double avgPrice; // 成本价
	private double totalPrice; // 成本总值
	private double pretium; // 销售价
	private double totalCost; // 总价值
	private int unitId; // 单位id 外键关联单位表
	private int brandId; // 品牌编号 外键关联品牌表
	private String supplierId; // 供应商编号 外键关联供应商表
	private String laidTime; // 入库时间
	private int storehouseId; // 所属仓库Id 外键关联仓库表
	private String repertoryUName; //单位Name（自定义）
	private String repertoryBName;  //品牌Name（自定义）
	private String repertorySeName;  //所属仓库Name(自定义)
	private String repertorySName;	//供应商(自定义)
	
	
	public String getRepertorySName() {
		return repertorySName;
	}

	public void setRepertorySName(String repertorySName) {
		this.repertorySName = repertorySName;
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

	public String getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public double getAvgPrice() {
		return avgPrice;
	}

	public void setAvgPrice(double avgPrice) {
		this.avgPrice = avgPrice;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public double getPretium() {
		return pretium;
	}

	public void setPretium(double pretium) {
		this.pretium = pretium;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
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

	public Repertory(String commodityId, String cName, int inventory, double avgPrice, double totalPrice,
			double pretium, double totalCost, int unitId, int brandId, String supplierId, String laidTime,
			int storehouseId, String repertoryUName, String repertoryBName, String repertorySeName,
			String repertorySName) {
		super();
		this.commodityId = commodityId;
		this.cName = cName;
		this.inventory = inventory;
		this.avgPrice = avgPrice;
		this.totalPrice = totalPrice;
		this.pretium = pretium;
		this.totalCost = totalCost;
		this.unitId = unitId;
		this.brandId = brandId;
		this.supplierId = supplierId;
		this.laidTime = laidTime;
		this.storehouseId = storehouseId;
		this.repertoryUName = repertoryUName;
		this.repertoryBName = repertoryBName;
		this.repertorySeName = repertorySeName;
		this.repertorySName = repertorySName;
	}

	public Repertory() {
		super();
		// TODO Auto-generated constructor stub
	}

}
