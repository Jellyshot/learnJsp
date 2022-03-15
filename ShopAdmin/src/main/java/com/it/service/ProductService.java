package com.it.service;

import java.util.List;

import com.it.domain.ProductVO;

public interface ProductService {

	//전체 레코드 조회
	public List<ProductVO> getList(); 
	
	//단일 레코드 조회
	public ProductVO read(ProductVO product);
	
	//레코드 입력
	public void insert(ProductVO product);
	
	//레코드 수정
	public void update(ProductVO product);
	
	//레코드 삭제 메서드. 역시 boolean타입을 주어 동작 확인함
	public void delete(ProductVO product);
}
