package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.BoardVO;
import com.it.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	//쿼리를 사용하기 위한 BoardMapper 객체를 멤버변수로 선언
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	//interface method 재정의
	//board를 넘기게 하여 b_num의 값을 가져옴.
	@Override 
	public BoardVO read(BoardVO board) {
		return mapper.read(board);
	}
	@Override
	public void insert(BoardVO board) {
		mapper.insert(board);
	}
	@Override
	public List<BoardVO> getList(){
		return mapper.getList();
	}
	@Override
	public void update(BoardVO board) {
		mapper.update(board);
	}
	@Override
	public void delete(BoardVO board) {
		mapper.delete(board);
	}
	
}
