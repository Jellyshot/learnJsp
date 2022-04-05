package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.DepVO;
import com.it.mapper.DepMapper;

import lombok.Setter;

@Service
public class DepServiceImpl {

	@Setter(onMethod_=@Autowired)
	public DepMapper mapper;
	
	public List<DepVO> getList(){
		return mapper.getList();
	}
	public DepVO read(DepVO dep) {
		return mapper.read(dep);
	}
	public void insert(DepVO dep) {
		mapper.insert(dep);
	}
	public void update(DepVO dep) {
		mapper.update(dep);
	}
	public void delete(DepVO dep) {
		mapper.delete(dep);
	}
}
