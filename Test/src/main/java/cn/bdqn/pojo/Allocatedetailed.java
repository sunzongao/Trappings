package cn.bdqn.pojo;

/**
 * ��������ϸ��
 * 
 * @author Administrator
 *
 */
public class Allocatedetailed {
	private String allocateId; // ��������
	private String commodityId; // ��Ʒ���Id
	private int brandId; // ��ƷƷ��
	private int unitId; // ��Ʒ��λ
	private String allocateTime; // ����ʱ��
	private int quantity; // ����
	private int storehouseId; // �����ֿ�
	private int userId; // ������Id
	private int walkTheQuantity; // ��������
	private int theOriginalWarehouse; // ԭ���Ĳֿ�
	private String allocatedetailedCName;  //��Ʒ���ƣ��Զ��壩
	private String allocatedetailedBName; //��ƷƷ�����ƣ��Զ��壩
	private String allocatedetailedUName; //��Ʒ��λ���ƣ��Զ��壩
	private String allocatedetailedStoName; //�����ֿ⣨�Զ��壩
	private String allocatedetailedSurName; //	����������(�Զ���)
	
	
	
	public String getAllocatedetailedCName() {
		return allocatedetailedCName;
	}

	public void setAllocatedetailedCName(String allocatedetailedCName) {
		this.allocatedetailedCName = allocatedetailedCName;
	}

	public String getAllocatedetailedBName() {
		return allocatedetailedBName;
	}

	public void setAllocatedetailedBName(String allocatedetailedBName) {
		this.allocatedetailedBName = allocatedetailedBName;
	}

	public String getAllocatedetailedUName() {
		return allocatedetailedUName;
	}

	public void setAllocatedetailedUName(String allocatedetailedUName) {
		this.allocatedetailedUName = allocatedetailedUName;
	}

	public String getAllocatedetailedStoName() {
		return allocatedetailedStoName;
	}

	public void setAllocatedetailedStoName(String allocatedetailedStoName) {
		this.allocatedetailedStoName = allocatedetailedStoName;
	}

	public String getAllocatedetailedSurName() {
		return allocatedetailedSurName;
	}

	public void setAllocatedetailedSurName(String allocatedetailedSurName) {
		this.allocatedetailedSurName = allocatedetailedSurName;
	}

	public int getWalkTheQuantity() {
		return walkTheQuantity;
	}

	public void setWalkTheQuantity(int walkTheQuantity) {
		this.walkTheQuantity = walkTheQuantity;
	}

	public int getTheOriginalWarehouse() {
		return theOriginalWarehouse;
	}

	public void setTheOriginalWarehouse(int theOriginalWarehouse) {
		this.theOriginalWarehouse = theOriginalWarehouse;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAllocateId() {
		return allocateId;
	}

	public void setAllocateId(String allocateId) {
		this.allocateId = allocateId;
	}

	public String getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}

	public String getAllocateTime() {
		return allocateTime;
	}

	public void setAllocateTime(String allocateTime) {
		this.allocateTime = allocateTime;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getStorehouseId() {
		return storehouseId;
	}

	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}


	public Allocatedetailed(String allocateId, String commodityId, int brandId, int unitId, String allocateTime,
			int quantity, int storehouseId, int userId, int walkTheQuantity, int theOriginalWarehouse,
			String allocatedetailedCName, String allocatedetailedBName, String allocatedetailedUName,
			String allocatedetailedStoName, String allocatedetailedSurName) {
		super();
		this.allocateId = allocateId;
		this.commodityId = commodityId;
		this.brandId = brandId;
		this.unitId = unitId;
		this.allocateTime = allocateTime;
		this.quantity = quantity;
		this.storehouseId = storehouseId;
		this.userId = userId;
		this.walkTheQuantity = walkTheQuantity;
		this.theOriginalWarehouse = theOriginalWarehouse;
		this.allocatedetailedCName = allocatedetailedCName;
		this.allocatedetailedBName = allocatedetailedBName;
		this.allocatedetailedUName = allocatedetailedUName;
		this.allocatedetailedStoName = allocatedetailedStoName;
		this.allocatedetailedSurName = allocatedetailedSurName;
	}

	public Allocatedetailed() {
		super();
	}

}
