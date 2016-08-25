package com.kedu.gany.dto;

public class GanyDto {
	
	private String empno;  	//사번
	private String deptno; 	//부서번호
	private String jobno;	//직급번호
	private String id;		//아이디
	private String pswd;	//비번
	private String ename;	//이름
	private String fjumin;	//주번앞
	private String bjumin;	//주번뒤
	private String hiredate;//입사일
	private String resigndate;//퇴사일
	private String email;	//이메일
	private String zipcode;	//우편번호
	private String addr;	//주소
	private String deaddr;	//상세주소
	private int sal;		//급여
	private String etc;		//비고
	private String eregdate;//사원등록일
	private String epic;	//사원사진
	private String admin;	//관리자여부

	public GanyDto() {
		
	}
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getJobno() {
		return jobno;
	}
	public void setJobno(String jobno) {
		this.jobno = jobno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getFjumin() {
		return fjumin;
	}
	public void setFjumin(String fjumin) {
		this.fjumin = fjumin;
	}
	public String getBjumin() {
		return bjumin;
	}
	public void setBjumin(String bjumin) {
		this.bjumin = bjumin;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public String getResigndate() {
		return resigndate;
	}
	public void setResigndate(String resigndate) {
		this.resigndate = resigndate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDeaddr() {
		return deaddr;
	}
	public void setDeaddr(String deaddr) {
		this.deaddr = deaddr;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getEregdate() {
		return eregdate;
	}
	public void setEregdate(String eregdate) {
		this.eregdate = eregdate;
	}
	public String getEpic() {
		return epic;
	}
	public void setEpic(String epic) {
		this.epic = epic;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "GanyDto [empno=" + empno + ", deptno=" + deptno + ", jobno=" + jobno + ", id=" + id + ", pswd=" + pswd
				+ ", ename=" + ename + ", fjumin=" + fjumin + ", bjumin=" + bjumin + ", hiredate=" + hiredate
				+ ", resigndate=" + resigndate + ", email=" + email + ", zipcode=" + zipcode + ", addr=" + addr
				+ ", deaddr=" + deaddr + ", sal=" + sal + ", etc=" + etc + ", eregdate=" + eregdate + ", epic=" + epic
				+ ", admin=" + admin + "]";
	}

}
