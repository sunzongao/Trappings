package cn.bdqn.pojo;

public class Permission {
	// Ȩ��id
	private int id;
	// Ȩ������
	private String permission;
	// Ȩ��Ӣ������
	private String flag;
	// Ȩ�޶�Ӧ��url��ַ
	private String url;
	//����id
	private int pid;
	//Ȩ�޵ȼ�
	private int grade;
	//ͼ��
	private String icon;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}
