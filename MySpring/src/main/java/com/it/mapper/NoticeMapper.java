package com.it.mapper;

import java.util.List;

import com.it.domain.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> getList();
	//getList의 반환값은 NoticeVO가 들어간 List타입. 전체를 불러오므로 변수는 필요 없음.
	
	public NoticeVO read(NoticeVO notice);
	//read의 반환값은 NoticeVO. 읽을 변수는 NoticeVO의 notice 객체(?)
	
	public void insert(NoticeVO notice);
	//create이므로 반환할 필요 없음. insert할 변수는 notice
	
	public void update(NoticeVO notice);
	//update도 데이터 테이블에 업데이트 하면 되므로 반환값 없음. 업데이트 할 데이터를 저장한 객체를 변수지정
	
	public void delete(NoticeVO notice);
	//delete 역시 반환할 필요 없음. 삭제할 데이터가 저장되어있는 notice객체를 변수로 지정.

}
