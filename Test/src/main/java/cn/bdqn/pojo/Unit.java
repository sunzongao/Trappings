package cn.bdqn.pojo;

import java.util.List;

/**
 * 商品单位类
 * @author GCL105659
 *
 */
public class Unit {
	//单位id
	private int unitId;
	//单位名称
	private String uName;
	
	private List<Commodity> cList;
	public List<Commodity> getcList() {
		return cList;
	}
	public void setcList(List<Commodity> cList) {
		this.cList = cList;
	}
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
}
