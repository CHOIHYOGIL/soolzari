package com.soolzari.shop.client.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class QnaPageData {
	private ArrayList<Qna> list;
	private String pageNavi;
	
	public QnaPageData(ArrayList<Qna> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
