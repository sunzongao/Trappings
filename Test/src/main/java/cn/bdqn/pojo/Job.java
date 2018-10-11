package cn.bdqn.pojo;
/**
 * 职位表
 * @author Administrator
 *
 */
public class Job {
	//职位id
	private int jobId;
	//职位名称
	private String jName;
	//所属不么id
	private int departmentId;
	
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	public String getjName() {
		return jName;
	}
	public void setjName(String jName) {
		this.jName = jName;
	}
}
