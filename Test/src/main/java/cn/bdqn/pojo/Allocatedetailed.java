package cn.bdqn.pojo;
/**
 * ��������ϸ��
 * @author Administrator
 *
 */
public class Allocatedetailed {
	private String allocateId;  //��������
	private String commodityId; //��Ʒ���Id
	private int brandId; //��ƷƷ��
	private int unitId; //��Ʒ��λ
	private String allocateTime; //����ʱ��
	private int quantity; //����
	private int storehouseId; //�����ֿ�
	private int userId; //������Id
	
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
			int quantity, int storehouseId, int userId) {
		super();
		this.allocateId = allocateId;
		this.commodityId = commodityId;
		this.brandId = brandId;
		this.unitId = unitId;
		this.allocateTime = allocateTime;
		this.quantity = quantity;
		this.storehouseId = storehouseId;
		this.userId = userId;
	}
	public Allocatedetailed() {
		super();
	}
	
	
	
}
