package cn.bdqn.pojo;

/**
 * �������
 * 
 * @author Administrator
 * 
 */
public class Badoverflow {
	private String badoverflowId; // �����絥��
	private int type; // ���������� 1.���� 2.����
	private int storehouseId; // �����ֿ�Id
	private String badoverflowTime; // ������ʱ��
	private int commodityId; // ��Ʒ���
	private String cName; // ��Ʒ����
	private int unitId; // ��Ʒ��λId
	private int amount; // ����
	private String comments; // ��ע
	private int employeeId; // ������id
	private String storehouseName; // �ֿ����� ���Զ��壩
	private String unitName; // ��Ʒ��λ���� ���Զ��壩
	private String employeeName; // ���������� ���Զ��壩

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
