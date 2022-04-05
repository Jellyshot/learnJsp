package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.WorkingstatusVO;
import com.it.mapper.WorkingstatusMapper;

import lombok.Setter;

@Service
public class WorkingstatusServiceImpl {

	@Setter(onMethod_=@Autowired)
	public WorkingstatusMapper mapper;
	       
	
	public List<WorkingstatusVO> getList(){
		return mapper.getList();
	}
	public WorkingstatusVO read(WorkingstatusVO workingstatus) {
		return mapper.read(workingstatus);
	}
	public void insert(WorkingstatusVO workingstatus) {
		mapper.insert(workingstatus);
	}
	public void update(WorkingstatusVO workingstatus) {
		mapper.update(workingstatus);
	}
	public void delete(WorkingstatusVO workingstatus) {
		mapper.delete(workingstatus);
	}
}
