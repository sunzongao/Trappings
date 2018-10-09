package cn.bdqn.pojo;

public class Customer {
	private String customerId;		//客户编号 主键
	private String cName;		//客户名称
	private String cContacts;		//联系人
	private String cPhone;		//联系电话
	private String cAddress;		//联系地址
	private int cId;		//客户类型 外键关联客户类型表
	private String comments;		//备注
	private String cTypename; //类型名称
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
