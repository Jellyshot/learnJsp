package com.it.domain;

import lombok.Data;

@Data
public class PageDTO {

	//현재페이지
	private int pageNum;
	//한 화면에 보여줄 레코드 갯수 (=limit)
	private int pageAmount;
	
	
	//기본 생성자	기본으로 현재페이지 1, limit 10으로 생성.
	public PageDTO() {
		this(1,10);
	}
	
	
	//해당 변수들에 값이 있으면, 그 값을 저장하는 생성자. 정보가 항상 생성되도록 만듬!	
	public PageDTO(int pageNum, int pageAmount) {
		this.pageNum = pageNum;
		this.pageAmount = pageAmount;
		
	}
}
