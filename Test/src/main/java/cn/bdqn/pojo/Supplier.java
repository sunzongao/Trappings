package cn.bdqn.pojo;

/**
 * ��Ӧ�̱�
 * 
 * @author Administrator
 * 
 */
public class Supplier {
	private String supplierId; // ��Ӧ��id ����
	private String sName; // ��Ӧ������
	private String sContacts; // ��ϵ��
	private String sPhone; // ��Ӧ����ϵ�绰
	private String sAddress; // ��Ӧ����ϵ��ַ
	private int sId; // ��Ӧ������ ���������Ӧ�����ͱ�
	private String comments; // ��ע

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsContacts() {
		return sContacts;
	}

	public void setsContacts(String sContacts) {
		this.sContacts = sContacts;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Supplier(String supplierId, String sName, String sContacts,
			String sPhone, String sAddress, int sId, String comments) {
		super();
		this.supplierId = supplierId;
		this.sName = sName;
		this.sContacts = sContacts;
		this.sPhone = sPhone;
		this.sAddress = sAddress;
		this.sId = sId;
		this.comments = comments;
	}

	public Supplier() {
		super();
		// TODO Auto-generated constructor stub
	}

}
