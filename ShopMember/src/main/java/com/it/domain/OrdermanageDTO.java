package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrdermanageDTO {
	
	private int om_code;
	private Date om_rdate;
	private String m_id;
	private String m_name; 
	private String d_status; // 배송상태
	private int p_code;
	private String p_name;
	private int os_cnt;
	private int p_price;
	private int os_price; //상품별 금액
	private String m_phone; 
	private String d_address01; // 배송주소
	private String d_address02; // 배송주소
	private String d_zimpcode; //우편번호
	private String d_etc; //배송테이블 비고란
	
	
}
