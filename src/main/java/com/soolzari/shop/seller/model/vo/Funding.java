package com.soolzari.shop.seller.model.vo;

import lombok.Data;

@Data
public class Funding {
	private int fundNo;
	private String fundName;
	private int fundMoney;
	private int fundChk;//펀딩 성공 여부
	private String fundDet;
	private int status;
	private String fundDate;
	private String fundEndDate;
	private String fundEnrollDate;
	private int selNo;
}
