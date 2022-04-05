package com.it.mapper;

import java.util.List;

import com.it.domain.A_categoryVO;

public interface A_categoryMapper {

	public List<A_categoryVO> getList();
	
	public A_categoryVO read(A_categoryVO a_category);
	
	public void insert(A_categoryVO a_category);
	
	public void update(A_categoryVO a_category);
	
	public void delete(A_categoryVO a_category);
}
