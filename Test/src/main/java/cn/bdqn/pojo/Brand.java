package cn.bdqn.pojo;
/**
 * Ʒ�Ʊ�
 * @author Administrator
 *
 */
public class Brand {
	private int brandId;		//Ʒ�Ʊ��
	private String bName;		//����Ʒ��
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
	public Brand(int brandId, String bName) {
		super();
		this.brandId = brandId;
		this.bName = bName;
	}
	public Brand() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
