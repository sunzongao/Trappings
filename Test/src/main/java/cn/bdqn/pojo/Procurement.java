package cn.bdqn.pojo;

import java.util.List;

/**
 * 采购单类
 * 
 * @author GCL105659
 *
 */
public class Procurement {
	// 采购单号
	private String procurementId;
	// 开单日期
	private String billingTime;
	// 供货商
	private String supplierId;
	// 供货商名称
	private String sName;
	// 仓库
	private int storehouseId;
	// 仓库名称
	private String stoName;
	// 经办人
	private int userId;
	// 经办人姓名
	private String surname;
	
	//签收
	private int sign;
	
	public int getSign() {
		return sign;
	}

	public void setSign(int sign) {
		this.sign = sign;
	}

	//制定人
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

	// 状态
	private int condition;
	// 备注
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
