package cn.bdqn.pojo;

import java.util.List;

/**
 * �ɹ�����
 * 
 * @author GCL105659
 *
 */
public class Procurement {
	// �ɹ�����
	private String procurementId;
	// ��������
	private String billingTime;
	// ������
	private String supplierId;
	// ����������
	private String sName;
	// �ֿ�
	private int storehouseId;
	// �ֿ�����
	private String stoName;
	// ������
	private int userId;
	// ����������
	private String surname;
	
	//ǩ��
	private int sign;
	
	public int getSign() {
		return sign;
	}

	public void setSign(int sign) {
		this.sign = sign;
	}

	//�ƶ���
	private int draftId;
	private String draName;
	
	public String getDraName() {
		return draName;
	}

	public void setDraName(String draName) {
		this.draName = draName;
	}

	public int getDraftId() {
		return draftId;
	}

	public void setDraftId(int draftId) {
		this.draftId = draftId;
	}

	// ״̬
	private int condition;
	// ��ע
	private String comments;

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

}
