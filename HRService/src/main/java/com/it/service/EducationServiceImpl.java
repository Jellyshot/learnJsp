package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.EducationVO;
import com.it.mapper.EducationMapper;

import lombok.Setter;

@Service
public class EducationServiceImpl {
	
	@Setter(onMethod_=@Autowired)
	private EducationMapper mapper;
	
	public List<EducationVO> getList(){
		return mapper.getList();
	}
	public EducationVO read(EducationVO education) {
		return mapper.read(education);
	}
	public void insert(EducationVO education) {
		mapper.insert(education);
	}
	public void update(EducationVO education) {
		mapper.update(education);
	}
	public void delete(EducationVO education) {
		mapper.delete(education);
	}
}
