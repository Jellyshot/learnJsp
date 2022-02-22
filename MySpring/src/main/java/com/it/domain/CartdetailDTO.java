package com.it.domain;

import lombok.Data;

@Data
public class CartdetailDTO {
// 조인한 데이터를 전달할 빈가방 역할을 할 클래스
// 장바구니의 내용에 따라 변수 선언
	
	private int cs_code;
	private int p_code;
	private String p_name;
	private int p_price;
	private int cs_cnt;
	
//	여기부터는 실제로 존재하지 않는 column(계산해서 처리할 수 있기 때문에 프로그래머 별로 다르게 처리함)
	private int cs_money;
}
