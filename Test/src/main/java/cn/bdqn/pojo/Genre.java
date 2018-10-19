package cn.bdqn.pojo;

import java.util.List;

/**
 * 商品类别表
 * @author GCL105659
 *
 */
public class Genre {
	//类别id
	private int genreId;
	//类别名称
	private String gName;
	
	private List<Commodity> cList;

	public int getGenreId() {
		return genreId;
	}

	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public List<Commodity> getcList() {
		return cList;
	}

	public void setcList(List<Commodity> cList) {
		this.cList = cList;
	}
}
