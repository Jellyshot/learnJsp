package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.A_categoryVO;
import com.it.mapper.A_categoryMapper;

import lombok.Setter;

@Service
public class A_categoryServiceImpl implements A_categoryService{

	@Setter(onMethod_=@Autowired)
	public A_categoryMapper mapper;
	
	public List<A_categoryVO> getList(){
		return mapper.getList();
	}
	public A_categoryVO read(A_categoryVO a_category) {
		return mapper.read(a_category);
	}
	public void insert(A_categoryVO a_category) {
		mapper.insert(a_category);
	}
	public void update(A_categoryVO a_category) {
		mapper.update(a_category);
	}
	public void delete(A_categoryVO a_category) {
		mapper.delete(a_category);
	}
}
