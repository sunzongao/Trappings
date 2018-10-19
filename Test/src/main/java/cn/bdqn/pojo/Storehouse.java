package cn.bdqn.pojo;

/**
 * ²Ö¿â±í
 * 
 * @author Administrator
 * 
 */
public class Storehouse {
	private int storehouseId; // ²Ö¿âId Ö÷¼ü
	private String stoName; // ²Ö¿âÃû
	
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
