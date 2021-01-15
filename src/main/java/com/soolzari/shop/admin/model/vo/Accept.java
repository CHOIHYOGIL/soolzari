package com.soolzari.shop.admin.model.vo;

import lombok.Data;

@Data
public class Accept {
	private int acceptNo;//상품/펀딩/클래스 번호
	private String acceptName;//상품/펀딩/클래스 이름
	private String seller;
	private String acceptDet;//설명
	private int acceptPrice;
	private String acceptDate;
}
