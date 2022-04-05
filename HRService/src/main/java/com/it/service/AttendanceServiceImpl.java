package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.AttendanceVO;
import com.it.mapper.AttendanceMapper;

import lombok.Setter;

@Service
public class AttendanceServiceImpl implements AttendanceService{


	@Setter(onMethod_=@Autowired)
	private AttendanceMapper mapper;
	
	public List<AttendanceVO> getList(){
		return mapper.getList();
	}
	
	public AttendanceVO read(AttendanceVO attendance) {
		return mapper.read(attendance);
	}
	public AttendanceVO readid(AttendanceVO attendance) {
		return mapper.readid(attendance);
	}
	
	public void insert(AttendanceVO attendance) {
		mapper.insert(attendance);
	}
	
	public void update(AttendanceVO attendance) {
		mapper.update(attendance);
	}
	
	public void delete(AttendanceVO attendance) {
		mapper.delete(attendance);
	}
}
