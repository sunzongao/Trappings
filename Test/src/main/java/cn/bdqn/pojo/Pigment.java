package cn.bdqn.pojo;

import java.util.List;

/**
 * 颜色表
 * @author GCL105659
 *
 */
public class Pigment {
	//颜色id
	private int pigmentId;
	//颜色名称
	private String pName;
	
	private List<Commodity> cList;
	public int getPigmentId() {
		return pigmentId;
	}
	public List<Commodity> getcList() {
		return cList;
	}
	public void setcList(List<Commodity> cList) {
		this.cList = cList;
	}
	public void setPigmentId(int pigmentId) {
		this.pigmentId = pigmentId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
}
