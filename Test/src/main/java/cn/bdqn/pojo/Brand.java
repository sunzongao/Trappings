package cn.bdqn.pojo;

import java.util.List;

/**
 * Ʒ����
 * @author GCL105659
 *
 */
public class Brand {
	//Ʒ��id
	private int brandId;
	//Ʒ������
	private String bName;
	
	private List<Commodity> cList;

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public List<Commodity> getcList() {
		return cList;
	}

	public void setcList(List<Commodity> cList) {
		this.cList = cList;
	}
}
