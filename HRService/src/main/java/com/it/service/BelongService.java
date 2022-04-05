package com.it.service;

import java.util.List;

import com.it.domain.BelongVO;

public interface BelongService {
	
	public List<BelongVO> getList();
	
	public BelongVO read(BelongVO belong);
	
	public void insert(BelongVO belong);
	
	public void update(BelongVO belong);
	
	public void delete(BelongVO belong);
}
