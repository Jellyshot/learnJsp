package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.BelongVO;
import com.it.mapper.BelongMapper;

import lombok.Setter;

@Service
public class BelongServiceImpl implements BelongService{
	
	@Setter(onMethod_=@Autowired)
	private BelongMapper mapper;
	
	public List<BelongVO> getList(){
		return mapper.getList(); 
	}
	public BelongVO read(BelongVO belong) {
		return mapper.read(belong);
	}
	
	public void insert(BelongVO belong) {
		mapper.insert(belong);
	}
	
	public void update(BelongVO belong) {
		mapper.update(belong);
	}
	
	public void delete(BelongVO belong) {
		mapper.delete(belong);
	}
	
}
