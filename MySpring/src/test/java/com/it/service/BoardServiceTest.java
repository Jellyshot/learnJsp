package com.it.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {
	
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	//@Test
	public void testRead() {
		BoardVO board = new BoardVO();
		board.setB_num(2);
		board = service.read(board);
		log.info(board);
	}
//	@Test
	public void testGetList() {
		//forEach구문에 인스턴스변수 board는 아무거나 넣어줘도 됨.
		service.getList().forEach(board->log.info(board));
	}
	//@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setB_name("이럴수가");
		board.setB_subject("css무료분이");
		board.setB_contents("너보다 잘한다 바부야!");
		service.insert(board);
		log.info(board);
	}
	//@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setB_num(2);
		board.setB_subject("게시판 수정 테스트");
		board.setB_name("관리자");
		board.setB_contents("게시판 테스트 중입니다");
		service.update(board);
		log.info(board);
	}
	//@Test
	public void testDelete() {
		BoardVO board = new BoardVO();
		board.setB_num(3);
		service.delete(board);
		log.info(board);
	}
}
