package cn.bdqn.pojo;

/**
 * �ֿ��
 * 
 * @author Administrator
 * 
 */
public class Storehouse {
	private int storehouseId; // �ֿ�Id ����
	private String stoName; // �ֿ���
	
	public int getStorehouseId() {
		return storehouseId;
	}
	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}
	public String getStoName() {
		return stoName;
	}
	public void setStoName(String stoName) {
		this.stoName = stoName;
	}
	public Storehouse() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Storehouse(int storehouseId, String stoName) {
		super();
		this.storehouseId = storehouseId;
		this.stoName = stoName;
	}
	
	
}
