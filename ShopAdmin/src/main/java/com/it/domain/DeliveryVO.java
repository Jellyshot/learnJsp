package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DeliveryVO {
	
	private int d_code;
	private String m_id;
	private String d_status; // 배송상태
	private String d_address01; // 배송주소
	private String d_address02; // 배송주소
	private String d_default; // 기본 배송지 지정
	private String d_zimpcode; //우편번호
	private String d_etc; //배송테이블 비고란
	private Date d_date;

	
}
