package cn.bdqn.pojo;

import java.util.List;

/**
 * ≥ﬂ¥Á¿‡
 * @author GCL105659
 *
 */
public class Dimension {
	//≥ﬂ¥Á±‡∫≈
	private int dimensionId;
	//≥ﬂ¥Á
	private String dName;
	
	private List<Commodity> cList;

	public int getDimensionId() {
		return dimensionId;
	}

	public void setDimensionId(int dimensionId) {
		this.dimensionId = dimensionId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public List<Commodity> getcList() {
		return cList;
	}

	public void setcList(List<Commodity> cList) {
		this.cList = cList;
	}
}
