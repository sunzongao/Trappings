package cn.bdqn.pojo;

import java.util.List;

/**
 * ��Ʒ����
 * @author GCL105659
 *
 */
public class Genre {
	//���id
	private int genreId;
	//�������
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
