package cn.bdqn.pojo;


/**
 * �ɹ�������
 * @author GCL105659
 *
 */
public class Detailed {
	private int id;
	//��Ʒ���
	private String commodityId;
	//�ɹ�����
	private String procurementId;
	//����
	private int number;
	//����
	private Double price;
	
	private Procurement procurement;
	private Commodity commodity;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(String commodityId) {
		this.commodityId = commodityId;
	}
	public String getProcurementId() {
		return procurementId;
	}
	public void setProcurementId(String procurementId) {
		this.procurementId = procurementId;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Procurement getProcurement() {
		return procurement;
	}
	public void setProcurement(Procurement procurement) {
		this.procurement = procurement;
	}
	public Commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
}
