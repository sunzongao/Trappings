package cn.bdqn.pojo;

import java.util.List;

/**
 * ��ɫ��
 * @author GCL105659
 *
 */
public class Pigment {
	//��ɫid
	private int pigmentId;
	//��ɫ����
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
