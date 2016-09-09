package com.kedu.call.dto;

public class CallDto {

	private int notno;	//공지사항번호
	private String empno;	//사원번호
	private String notname;	//공지사항제목
	private String notdate;	//공지사항작성일
	private int nothits;	//공지사항조회수
	private String notcon;	//공지사항내용
	private String notdel;	//공지사항 삭제 여부
	
	private int comno;		//댓글 번호
	private String comcon;	//댓글 내용
	private String comdate;	//댓글 작성일
	private String comdel;	//댓글 삭제 여부
	
	public CallDto() {
	
	}

	public int getNotno() {
		return notno;
	}

	public void setNotno(int notno) {
		this.notno = notno;
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String getNotname() {
		return notname;
	}

	public void setNotname(String notname) {
		this.notname = notname;
	}

	public String getNotdate() {
		return notdate;
	}

	public void setNotdate(String notdate) {
		this.notdate = notdate;
	}

	public int getNothits() {
		return nothits;
	}

	public void setNothits(int nothits) {
		this.nothits = nothits;
	}

	public String getNotcon() {
		return notcon;
	}

	public void setNotcon(String notcon) {
		this.notcon = notcon;
	}

	public String getNotdel() {
		return notdel;
	}

	public void setNotdel(String notdel) {
		this.notdel = notdel;
	}
	

	public int getComno() {
		return comno;
	}

	public void setComno(int comno) {
		this.comno = comno;
	}

	public String getComcon() {
		return comcon;
	}

	public void setComcon(String comcon) {
		this.comcon = comcon;
	}

	public String getComdate() {
		return comdate;
	}

	public void setComdate(String comdate) {
		this.comdate = comdate;
	}

	public String getComdel() {
		return comdel;
	}

	public void setComdel(String comdel) {
		this.comdel = comdel;
	}

	@Override
	public String toString() {
		return "CallDto [notno=" + notno + ", empno=" + empno + ", notname=" + notname + ", notdate=" + notdate
				+ ", nothits=" + nothits + ", notcon=" + notcon + ", notdel=" + notdel + ", comno=" + comno
				+ ", comcon=" + comcon + ", comdate=" + comdate + ", comdel=" + comdel + "]";
	}

}
