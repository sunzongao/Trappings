package cn.bdqn.pojo;



/**
 * ��ⵥ��
 * @author Administrator
 *
 */
public class Put {
	public String procurementId;//�ɹ�����
	
	public Procurement procurement;//�ɹ�������
	
	public String putTime;//���ʱ��

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
