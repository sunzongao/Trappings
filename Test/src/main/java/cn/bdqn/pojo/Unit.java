package cn.bdqn.pojo;
/**
 * ��Ʒ��λ��
 * @author Administrator
 *
 */
public class Unit {
	private int unitId;	//��λid ����
	private String uName;		//��λ����
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
