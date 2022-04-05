package com.it.mapper;

import java.util.List;

import com.it.domain.EmpltypeVO;

public interface EmpltypeMapper {

	public List<EmpltypeVO> getList();
	
	public EmpltypeVO read(EmpltypeVO empltype);
	
	public void insert(EmpltypeVO empltype);
	
	public void update(EmpltypeVO empltype);
	
	public void delete(EmpltypeVO empltype);
}
