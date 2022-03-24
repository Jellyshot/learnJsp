package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.Board2VO;
import com.it.domain.PageDTO;
import com.it.mapper.Board2Mapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Board2ServiceImpl implements Board2Service {
	//쿼리를 사용하기 위한 BoardMapper 객체를 멤버변수로 선언
	@Setter(onMethod_=@Autowired)
	private Board2Mapper mapper;
	
	//interface method 재정의
	//board를 넘기게 하여 b_num의 값을 가져옴.
	@Override 
	public Board2VO read(Board2VO board) {
		return mapper.read(board);
	}
	@Override
	public void insert(Board2VO board) {
		mapper.insert(board);
	}
	@Override
	public List<Board2VO> getList(PageDTO page){
		return mapper.getList(page);
	}
	@Override
	public void update(Board2VO board) {
		mapper.update(board);
	}
	@Override
	public void delete(Board2VO board) {
		mapper.delete(board);
	}
	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

}
