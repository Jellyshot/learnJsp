package com.it.mapper;

import java.util.List;

import com.it.domain.EducationVO;

public interface EducationMapper {
	
	public List<EducationVO> getList();
	public EducationVO read(EducationVO education);
	public void insert(EducationVO education);
	public void update(EducationVO education);
	public void delete(EducationVO education);
}
