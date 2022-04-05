package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.QualificationVO;
import com.it.mapper.QualificationMapper;

import lombok.Setter;

@Service
public class QualificationServiceImpl implements QualificationService{

	@Setter(onMethod_=@Autowired)
	private QualificationMapper mapper;
	
	public List<QualificationVO> getList(){
		return mapper.getList();
	}
	public QualificationVO read(QualificationVO qualification) {
		return mapper.read(qualification);
	}
	public void insert(QualificationVO qualification) {
		mapper.insert(qualification);
	}
	public void update(QualificationVO qualification) {
		mapper.update(qualification);
	}
	public void delete(QualificationVO qualification) {
		mapper.delete(qualification);
	}
}
