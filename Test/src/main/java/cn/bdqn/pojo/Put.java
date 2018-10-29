package cn.bdqn.pojo;



/**
 * 入库单类
 * @author Administrator
 *
 */
public class Put {
	public String procurementId;//采购单号
	
	public Procurement procurement;//采购单对象
	
	public String putTime;//入库时间

	public String getProcurementId() {
		return procurementId;
	}

	public void setProcurementId(String procurementId) {
		this.procurementId = procurementId;
	}

	public Procurement getProcurement() {
		return procurement;
	}

	public void setProcurement(Procurement procurement) {
		this.procurement = procurement;
	}

	public String getPutTime() {
		return putTime;
	}

	public void setPutTime(String putTime) {
		this.putTime = putTime;
	}
}
