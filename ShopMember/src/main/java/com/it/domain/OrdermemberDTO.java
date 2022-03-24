package com.it.domain;

import lombok.Data;

@Data
public class OrdermemberDTO {
	
	private int om_code;
	private String m_id;
	private String m_name;
	
//	총금액 저장할 변수
	private int om_total;
}
