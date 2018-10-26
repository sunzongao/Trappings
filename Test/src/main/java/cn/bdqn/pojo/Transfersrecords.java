package cn.bdqn.pojo;
/**
 * 库存调拨记录表
 * @author Administrator
 *
 */
public class Transfersrecords {
	private String allocateId;  //调拨单号
	private String allocateTime; //调拨时间
	private int userId; // 调拨人Id
	public String getAllocateId() {
		return allocateId;
	}
	public void setAllocateId(String allocateId) {
		this.allocateId = allocateId;
	}
	public String getAllocateTime() {
		return allocateTime;
	}
	public void setAllocateTime(String allocateTime) {
		this.allocateTime = allocateTime;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Transfersrecords(String allocateId, String allocateTime, int userId) {
		super();
		this.allocateId = allocateId;
		this.allocateTime = allocateTime;
		this.userId = userId;
	}
	public Transfersrecords() {
		super();
	}
	
}
