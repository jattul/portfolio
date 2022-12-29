package com.naver.erp;

// 자주 묻는 질문 게시판 
public class BoardQuestionDTO {

	private int no;             
	private String email;        
	private String title;          
	private String content;     
	private String readCount; 
	private String regDate;    
	private String reportCount;
	private String commentCount;
	private String issecret;
	private String partNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadCount() {
		return readCount;
	}
	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getReportCount() {
		return reportCount;
	}
	public void setReportCount(String reportCount) {
		this.reportCount = reportCount;
	}
	public String getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
	}

	public String getPartNo() {
		return partNo;
	}
	public void setPartNo(String partNo) {
		this.partNo = partNo;
	}
	public String getIssecret() {
		return issecret;
	}
	public void setIssecret(String issecret) {
		this.issecret = issecret;
	}
	
	
	
	
}
