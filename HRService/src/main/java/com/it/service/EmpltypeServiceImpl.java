package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.EmpltypeVO;
import com.it.mapper.EmpltypeMapper;

import lombok.Setter;

@Service
public class EmpltypeServiceImpl {

	@Setter(onMethod_=@Autowired)
	private EmpltypeMapper mapper;
	
	public List<EmpltypeVO> getList(){
		return mapper.getList();
	}
	public EmpltypeVO read(EmpltypeVO empltype) {
		return mapper.read(empltype);
	}
	public void insert(EmpltypeVO empltype) {
		mapper.insert(empltype);
	}
	public void update(EmpltypeVO empltype) {
		mapper.update(empltype);
	}
	public void delete(EmpltypeVO empltype) {
		mapper.delete(empltype);
	}
}
