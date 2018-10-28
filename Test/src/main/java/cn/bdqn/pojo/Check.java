package cn.bdqn.pojo;

/**
 * 盘点表
 * 
 * @author Administrator
 * 
 */
public class Check {
	private String checkId; // 盘点单号
	private String checkTime; // 盘点时间
	private int userId; // 盘点人Id
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
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Check() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Check(String checkId, String checkTime, int userId) {
		super();
		this.checkId = checkId;
		this.checkTime = checkTime;
		this.userId = userId;
	}

	

}
