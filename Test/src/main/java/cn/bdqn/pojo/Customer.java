package cn.bdqn.pojo;

public class Customer {
	private String customerId;		//�ͻ���� ����
	private String cName;		//�ͻ�����
	private String cContacts;		//��ϵ��
	private String cPhone;		//��ϵ�绰
	private String cAddress;		//��ϵ��ַ
	private int cId;		//�ͻ����� ��������ͻ����ͱ�
	private String comments;		//��ע
	private String cTypename; //��������
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcContacts() {
		return cContacts;
	}
	public void setcContacts(String cContacts) {
		this.cContacts = cContacts;
	}
	public String getcPhone() {
		return cPhone;
	}
	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}
	public String getcAddress() {
		return cAddress;
	}
	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getcTypename() {
		return cTypename;
	}
	public void setcTypename(String cTypename) {
		this.cTypename = cTypename;
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customer(String customerId, String cName, String cContacts, String cPhone, String cAddress, int cId,
			String comments, String cTypename) {
		super();
		this.customerId = customerId;
		this.cName = cName;
		this.cContacts = cContacts;
		this.cPhone = cPhone;
		this.cAddress = cAddress;
		this.cId = cId;
		this.comments = comments;
		this.cTypename = cTypename;
	}
	

}
