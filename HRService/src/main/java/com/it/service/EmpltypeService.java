package com.it.service;

import java.util.List;

import com.it.domain.EmpltypeVO;

public interface EmpltypeService {

	public List<EmpltypeVO> getList();
	
	public EmpltypeVO read(EmpltypeVO empltype);
	
	public void insert(EmpltypeVO empltype);
	
	public void update(EmpltypeVO empltype);
	
	public void delete(EmpltypeVO empltype);
}
