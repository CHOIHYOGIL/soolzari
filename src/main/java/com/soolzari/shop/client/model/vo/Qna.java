package com.soolzari.shop.client.model.vo;

public class Qna {
	private int qnaNo;
	private String qnaName;
	private int qnaWriter;
	private String qnaCon;
	private String qnaEnroll;
	private int qnaAns;
	private String qnaId;
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qna(int qnaNo, String qnaName, int qnaWriter, String qnaCon, String qnaEnroll, int qnaAns, String qnaId) {
		super();
		this.qnaNo = qnaNo;
		this.qnaName = qnaName;
		this.qnaWriter = qnaWriter;
		this.qnaCon = qnaCon;
		this.qnaEnroll = qnaEnroll;
		this.qnaAns = qnaAns;
		this.qnaId = qnaId;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaName() {
		return qnaName;
	}
	public void setQnaName(String qnaName) {
		this.qnaName = qnaName;
	}
	public int getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(int qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaCon() {
		return qnaCon;
	}
	public void setQnaCon(String qnaCon) {
		this.qnaCon = qnaCon;
	}
	public String getQnaContentBr() {
		return qnaCon.replaceAll("\r\n", "<br>");
	}
	public String getQnaEnroll() {
		return qnaEnroll;
	}
	public void setQnaEnroll(String qnaEnroll) {
		this.qnaEnroll = qnaEnroll;
	}
	public int getQnaAns() {
		return qnaAns;
	}
	public void setQnaAns(int qnaAns) {
		this.qnaAns = qnaAns;
	}
	public String getQnaId() {
		return qnaId;
	}
	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}
}
