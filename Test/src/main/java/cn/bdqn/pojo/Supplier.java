package cn.bdqn.pojo;

/**
 * 供应商类
 * @author GCL105659
 *
 */
public class Supplier {
	
	private String supplierId;
	private String sName;
	private String sContacts;
	private String sSex;
	private String sPhone;
	private String sEmail;
	private String sAddress;
	private String sDate;
	private int sStatus;
	private String comments;
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
	public String getsSex() {
		return sSex;
	}
	public void setsSex(String sSex) {
		this.sSex = sSex;
	}
	public String getsPhone() {
		return sPhone;
	}
	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}
	public String getsEmail() {
		return sEmail;
	}
	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}
	public String getsAddress() {
		return sAddress;
	}
	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getsStatus() {
		return sStatus;
	}
	public void setsStatus(int sStatus) {
		this.sStatus = sStatus;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Supplier() {
		super();
	}
	public Supplier(String supplierId, String sName, String sContacts, String sSex, String sPhone, String sEmail,
			String sAddress, String sDate, int sStatus, String comments) {
		super();
		this.supplierId = supplierId;
		this.sName = sName;
		this.sContacts = sContacts;
		this.sSex = sSex;
		this.sPhone = sPhone;
		this.sEmail = sEmail;
		this.sAddress = sAddress;
		this.sDate = sDate;
		this.sStatus = sStatus;
		this.comments = comments;
	}
}
