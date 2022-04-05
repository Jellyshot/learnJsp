package com.it.service;

import java.util.List;

import com.it.domain.EmppositionVO;

public interface EmppositionService {

	public List<EmppositionVO> getList();
	
	public EmppositionVO read(EmppositionVO empposition);
	
	public void insert(EmppositionVO empposition);
	
	public void update(EmppositionVO empposition);
	
	public void delete(EmppositionVO empposition);
}
