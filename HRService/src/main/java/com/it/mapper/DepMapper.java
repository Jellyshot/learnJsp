package com.it.mapper;

import java.util.List;

import com.it.domain.DepVO;

public interface DepMapper {
	
	public List<DepVO> getList();
	public DepVO read(DepVO dep);
	public void insert(DepVO dep);
	public void update(DepVO dep);
	public void delete(DepVO dep);
}
