package com.naver.erp;

public class MemberDTO {
	int m_no;
	String email;
	int pw;
	String m_name;
	String addr;
	int rankNo;
	int phone;
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPw() {
		return pw;
	}
	public void setPw(int pw) {
		this.pw = pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getRankNo() {
		return rankNo;
	}
	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
}
