package cn.bdqn.pojo;

/**
 * 报损报溢表
 * 
 * @author Administrator
 * 
 */
public class Badoverflow {
	private String badoverflowId; // 报损报溢单号
	private int type; // 报损报溢类型 1.报损 2.报溢
	private int storehouseId; // 所属仓库Id
	private String badoverflowTime; // 报损报溢时间
	private int commodityId; // 商品编号
	private String cName; // 商品名称
	private int unitId; // 商品单位Id
	private int amount; // 数量
	private String comments; // 备注
	private int employeeId; // 经办人id
	private String storehouseName; // 仓库名称 （自定义）
	private String unitName; // 商品单位名称 （自定义）
	private String employeeName; // 经办人姓名 （自定义）

	public String getStorehouseName() {
		return storehouseName;
	}

	public void setStorehouseName(String storehouseName) {
		this.storehouseName = storehouseName;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getBadoverflowId() {
		return badoverflowId;
	}

	public void setBadoverflowId(String badoverflowId) {
		this.badoverflowId = badoverflowId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStorehouseId() {
		return storehouseId;
	}

	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}

	public String getBadoverflowTime() {
		return badoverflowTime;
	}

	public void setBadoverflowTime(String badoverflowTime) {
		this.badoverflowTime = badoverflowTime;
	}

	public int getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(int commodityId) {
		this.commodityId = commodityId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public Badoverflow(String badoverflowId, int type, int storehouseId,
			String badoverflowTime, int commodityId, String cName, int unitId,
			int amount, String comments, int employeeId, String storehouseName,
			String unitName, String employeeName) {
		super();
		this.badoverflowId = badoverflowId;
		this.type = type;
		this.storehouseId = storehouseId;
		this.badoverflowTime = badoverflowTime;
		this.commodityId = commodityId;
		this.cName = cName;
		this.unitId = unitId;
		this.amount = amount;
		this.comments = comments;
		this.employeeId = employeeId;
		this.storehouseName = storehouseName;
		this.unitName = unitName;
		this.employeeName = employeeName;
	}

	public Badoverflow() {
		super();
		// TODO Auto-generated constructor stub
	}

}
