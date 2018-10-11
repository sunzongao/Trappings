package cn.bdqn.pojo;
/**
 * 商品单位表
 * @author Administrator
 *
 */
public class Unit {
	private int unitId;	//单位id 主键
	private String uName;		//单位名称
	public int getUnitId() {
		return unitId;
	}
	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public Unit(int unitId, String uName) {
		super();
		this.unitId = unitId;
		this.uName = uName;
	}
	public Unit() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
