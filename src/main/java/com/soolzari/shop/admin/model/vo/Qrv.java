package com.soolzari.shop.admin.model.vo;

public class Qrv {
	private int qrvNo;//답변 번호
	private int qnaNo;
	private String qrvWriter;
	private String qrvContent;
	private String qrvEnroll;
	public Qrv() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qrv(int qrvNo, int qnaNo, String qrvWriter, String qrvContent, String qrvEnroll) {
		super();
		this.qrvNo = qrvNo;
		this.qnaNo = qnaNo;
		this.qrvWriter = qrvWriter;
		this.qrvContent = qrvContent;
		this.qrvEnroll = qrvEnroll;
	}
	public int getQrvNo() {
		return qrvNo;
	}
	public void setQrvNo(int qrvNo) {
		this.qrvNo = qrvNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQrvWriter() {
		return qrvWriter;
	}
	public void setQrvWriter(String qrvWriter) {
		this.qrvWriter = qrvWriter;
	}
	public String getQrvContent() {
		return qrvContent;
	}
	public void setQrvContent(String qrvContent) {
		this.qrvContent = qrvContent;
	}
	public String getQrvContentBr() {
		return qrvContent.replaceAll("\r\n", "<br>");
	}
	public String getQrvEnroll() {
		return qrvEnroll;
	}
	public void setQrvEnroll(String qrvEnroll) {
		this.qrvEnroll = qrvEnroll;
	}
}
