package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.ProductVO;
import com.it.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiceImpl implements ProductService{
	
	
	@Setter(onMethod_ = @Autowired)
	public ProductMapper mapper;
	
	//전체 레코드 조회
	@Override
	public List<ProductVO> getList(){
		return mapper.getList();
	}
	
	//단일 레코드 조회
	@Override
	public ProductVO read(ProductVO product) {
		return mapper.read(product);
	}
	//레코드 입력
	@Override
	public void insert(ProductVO product) {
		mapper.insert(product);
	}
	
	//레코드 수정
	@Override
	public void update(ProductVO product) {
		mapper.update(product);
	}
	
	//레코드 삭제 메서드. 역시 boolean타입을 주어 동작 확인함
	@Override
	public void delete(ProductVO product) {
		mapper.delete(product);
	}
}
