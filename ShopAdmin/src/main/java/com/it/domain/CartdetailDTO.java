package com.it.domain;

import lombok.Data;

@Data
public class CartdetailDTO {

	private int cs_code;
	private int p_code;
	private String p_name;
	private int p_price;
	private int cs_cnt;
	
	private int cs_money;
}
