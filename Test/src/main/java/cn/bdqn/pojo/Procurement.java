package cn.bdqn.pojo;

import java.util.List;

/**
 * �ɹ�����
 * @author GCL105659
 *
 */
public class Procurement {
	//�ɹ�����
	private String procurementId;
	//��������
	private String billingTime;
	//������
	private int supplierId;
	//����������
	private String sName;
	//�ֿ�
	private int storehouseId;
	//�ֿ�����
	private String stoName;
	//��ע
	private String comments;
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	private List<Detailed> dList;
	
	public List<Detailed> getdList() {
		return dList;
	}
	public void setdList(List<Detailed> dList) {
		this.dList = dList;
	}
	public String getProcurementId() {
		return procurementId;
	}
	public void setProcurementId(String procurementId) {
		this.procurementId = procurementId;
	}
	public String getBillingTime() {
		return billingTime;
	}
	public void setBillingTime(String billingTime) {
		this.billingTime = billingTime;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public int getStorehouseId() {
		return storehouseId;
	}
	public void setStorehouseId(int storehouseId) {
		this.storehouseId = storehouseId;
	}
	public String getStoName() {
		return stoName;
	}
	public void setStoName(String stoName) {
		this.stoName = stoName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	//������
	private int id;
	//����������
	private String surname;
	//״̬
	private int condition;
}
