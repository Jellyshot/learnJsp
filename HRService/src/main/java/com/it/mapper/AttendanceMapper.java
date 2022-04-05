package com.it.mapper;

import java.util.List;

import com.it.domain.AttendanceVO;

public interface AttendanceMapper {
	
	public List<AttendanceVO> getList();
	
	public AttendanceVO read(AttendanceVO attendance);
	public AttendanceVO readid(AttendanceVO attendance);
	
	public void insert(AttendanceVO attendance);
	
	public void update(AttendanceVO attendance);
	
	public void delete(AttendanceVO attendance);

}
