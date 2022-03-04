package com.it.service;

import java.util.List;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;

public interface NoticeService {
	//CRUD 애네들은 작업을 할때, 각 데이터를 담을 가방이 필요함으로 매개변수 지정을 해주어야 함.
	//getList의 경우 table전체를 불러오면 되니까 따로 한줄만 뺄 필요 없지만 CRUD는 n_num으로 선택해줘야 하는 애들이니까 있어야 됨

	public List<NoticeVO> getList(PageDTO page);
	
	public NoticeVO read(NoticeVO notice);
	
	public void insert(NoticeVO notice);
	
	public void update(NoticeVO notice);
	
	public void delete(NoticeVO notice);
	
	public int getTotalCount();
}
