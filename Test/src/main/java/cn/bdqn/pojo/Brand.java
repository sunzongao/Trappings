package cn.bdqn.pojo;

import java.util.List;

/**
 * 品牌类
 * @author GCL105659
 *
 */
public class Brand {
	//品牌id
	private int brandId;
	//品牌名称
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
