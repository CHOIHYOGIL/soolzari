package com.soolzari.shop.seller.model.vo;

import lombok.Data;

@Data
public class GoodsDetail {
	private int gdsNo;
	private String gdsName;
	private int gdsPri;
	private int gdsBcnt;
	private int selNo;
	private int status;
	private String goodsDate;
	private String goodsType;
	public String filepath;
	public String filename;
	public String imgType;
	public int typeNo;
	public double avgRevScore;
	public double countRevScore;
}
