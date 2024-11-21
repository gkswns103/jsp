package dto;

public class StudentDTO { 
	private String stunumber,stupwd, stuname, major, grade;
	private int proidx;
	
	
	public String getStunumber() {
		return stunumber;
	}
	public void setStunumber(String stunumber) {
		this.stunumber = stunumber;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getProidx() {
		return proidx;
	}
	public void setProidx(int proidx) {
		this.proidx = proidx;
	}
	public String getStupwd() {
		return stupwd;
	}
	public void setStupwd(String stupwd) {
		this.stupwd = stupwd;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	
}
