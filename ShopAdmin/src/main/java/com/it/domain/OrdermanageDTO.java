package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrdermanageDTO {
	
	private int om_code;
	private Date om_rdate;
	private String m_id;
	private String m_name; 
	private String om_status; // 배송상태
	private int p_code;
	private String p_name;
	private int os_cnt;
	private int p_price;
	private int os_price; //상품별 금액
	private String m_phone; 
	private String m_address01; // 배송주소
	private String m_address02; // 배송주소
	private String m_zipcode; //우편번호
	
	
}
