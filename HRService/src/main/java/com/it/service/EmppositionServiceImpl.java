package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.EmppositionVO;
import com.it.mapper.EmppositionMapper;

import lombok.Setter;

@Service
public class EmppositionServiceImpl {
	
	@Setter(onMethod_=@Autowired)
	public EmppositionMapper mapper;
	
	public List<EmppositionVO> getList(){
		return mapper.getList();
	}
	public EmppositionVO read(EmppositionVO empposition) {
		return mapper.read(empposition);
	}
	public void insert(EmppositionVO empposition) {
		mapper.insert(empposition);
	}
	public void update(EmppositionVO empposition) {
		mapper.update(empposition);
	}
	public void delete(EmppositionVO empposition) {
		mapper.delete(empposition);
	}

}
