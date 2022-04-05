package com.it.service;

import java.util.List;

import com.it.domain.QualificationVO;

public interface QualificationService {

	public List<QualificationVO> getList();
	
	public QualificationVO read(QualificationVO qulification);
	
	public void insert(QualificationVO qulification);
	
	public void update(QualificationVO qulification);

	public void delete(QualificationVO qulification);
}
