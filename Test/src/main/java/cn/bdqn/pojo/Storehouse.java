package cn.bdqn.pojo;

/**
 * �ֿ��
 * 
 * @author Administrator
 * 
 */
public class Storehouse {
	private int storehouseId; // �ֿ�Id ����
	private String sName; // �ֿ���

	public int getStorehouseId() {
		return storehouseId;
	}

	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public Storehouse(int storehouseId, String sName) {
		super();
		this.storehouseId = storehouseId;
		this.sName = sName;
	}

	public Storehouse() {
		super();
		// TODO Auto-generated constructor stub
	}

}
