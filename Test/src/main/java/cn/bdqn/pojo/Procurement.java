package cn.bdqn.pojo;

import java.util.List;

/**
 * 采购单类
 * @author GCL105659
 *
 */
public class Procurement {
	//采购单号
	private String procurementId;
	//开单日期
	private String billingTime;
	//供货商
	private int supplierId;
	//供货商名称
	private String sName;
	//仓库
	private int storehouseId;
	//仓库名称
	private String stoName;
	//备注
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
	//经办人
	private int id;
	//经办人姓名
	private String surname;
	//状态
	private int condition;
}
