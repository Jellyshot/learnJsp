package com.it.service;

import java.util.List;

import com.it.domain.WorkingstatusVO;

public interface WorkingstatusService {
	

	public List<WorkingstatusVO> getList();
	
	public WorkingstatusVO read(WorkingstatusVO workingstatus);
	
	public void insert(WorkingstatusVO workingstatus);
	
	public void update(WorkingstatusVO workingstatus);
	
	public void delete(WorkingstatusVO workingstatus);

}
