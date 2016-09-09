package com.kedu.euro.dto;

public class EuroDto {

	private int prono; 		// 프로젝트 번호
	private String pname; 	// 프로젝트 이름
	private String prosta; 	// 프로젝트 시작일
	private String penddate;// 프로젝트 종요일
	private String pregdate;// 등록일
	private String pcontent;// 상세 내용

	public EuroDto() {

	}

	public int getProno() {
		return prono;
	}

	public void setProno(int prono) {
		this.prono = prono;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getProsta() {
		return prosta;
	}

	public void setProsta(String prosta) {
		this.prosta = prosta;
	}

	public String getPenddate() {
		return penddate;
	}

	public void setPenddate(String penddate) {
		this.penddate = penddate;
	}

	public String getPregdate() {
		return pregdate;
	}

	public void setPregdate(String pregdate) {
		this.pregdate = pregdate;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	@Override
	public String toString() {
		return "EuroDto [prono=" + prono + ", pname=" + pname + ", prosta=" + prosta + ", penddate=" + penddate
				+ ", pregdate=" + pregdate + ", pcontent=" + pcontent + "]";
	}
	
}
