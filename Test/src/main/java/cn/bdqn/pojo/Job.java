package cn.bdqn.pojo;
/**
 * ְλ��
 * @author Administrator
 *
 */
public class Job {
	//ְλid
	private int jobId;
	//ְλ����
	private String jName;
	//������ôid
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
