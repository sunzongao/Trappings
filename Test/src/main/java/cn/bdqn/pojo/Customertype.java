package cn.bdqn.pojo;

public class Customertype {
	private int id;		//客户类型Id
	private String name;	//类型名称
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Customertype() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Customertype(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	

}
