package com.it.service;

import java.util.List;

import com.it.domain.BoardVO;

public interface BoardService {
//여기부터 Spring MVC 명령규칙에서 Business layer
	
	//단일 레코드 조회
	public BoardVO read(BoardVO board); 
	//레코드 입력
	public void insert(BoardVO board); 
	//BoardVO만을 데이터로 받는 List타입의 함수 getList생성
	//전체 레코드 조회
	public List<BoardVO> getList(); 
	//업데이트가 잘 되었는지 확인하는 하기 위해 boolean타입을 줌
	public void update(BoardVO board);
	//레코드 삭제 메서드. 역시 boolean타입을 줌
	public void delete(BoardVO board);
	
//	BoardVO read(BoardVO board);
	
}
