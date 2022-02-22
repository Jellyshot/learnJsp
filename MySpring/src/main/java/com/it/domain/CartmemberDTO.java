package com.it.domain;

import lombok.Data;

@Data
public class CartmemberDTO {
	private int cm_code;
	private String m_id;
	private String m_name;
	
//	총금액 저장할 변수
	private int cm_total;
}
