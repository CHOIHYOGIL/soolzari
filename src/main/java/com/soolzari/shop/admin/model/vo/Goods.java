package com.soolzari.shop.admin.model.vo;

import lombok.Data;

@Data
public class Goods {
	private int goodsNo;
	private String goodsName;
	private int goodsPrice;
	private int buyCount;
	private String seller;
	private int status;
	private String goodsDate;
	private String goodsType;
}
