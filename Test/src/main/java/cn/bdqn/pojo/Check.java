package cn.bdqn.pojo;

/**
 * �̵��
 * 
 * @author Administrator
 * 
 */
public class Check {
	private String checkId; // �̵㵥��
	private String checkTime; // �̵�ʱ��
	private int storehouseId; // �̵�ֿ�id
	private int userId; // �̵���Id
	private int commodityId; // ��Ʒ���
	private int checkAmount; // �̵���

	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}

	public String getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}

	public int getStorehouseId() {
		return storehouseId;
	}

	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(int commodityId) {
		this.commodityId = commodityId;
	}

	public int getCheckAmount() {
		return checkAmount;
	}

	public void setCheckAmount(int checkAmount) {
		this.checkAmount = checkAmount;
	}

	public Check(String checkId, String checkTime, int storehouseId, int userId, int commodityId, int checkAmount) {
		super();
		this.checkId = checkId;
		this.checkTime = checkTime;
		this.storehouseId = storehouseId;
		this.userId = userId;
		this.commodityId = commodityId;
		this.checkAmount = checkAmount;
	}

	public Check() {
		super();
		// TODO Auto-generated constructor stub
	}

}
