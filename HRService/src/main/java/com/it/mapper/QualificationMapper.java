package com.it.mapper;

import java.util.List;

import com.it.domain.QualificationVO;

public interface QualificationMapper {
	
	public List<QualificationVO> getList();
	
	public QualificationVO read(QualificationVO qualification);
	
	public void insert(QualificationVO qualification);
	
	public void update(QualificationVO qualification);

	public void delete(QualificationVO qualification);
}
