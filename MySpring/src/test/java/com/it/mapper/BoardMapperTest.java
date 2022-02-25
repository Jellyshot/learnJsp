package com.it.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.BoardVO;
import com.it.domain.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//이렇게 @를 해주는걸 Annotation이라고 한다.

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

//	멤버변수로 BoardMapper를 선언하여 mapper를 객체로 만듬.
//	(BoardMapper의 메서드를 객체에 담아 사용하기 위해)
//  @Setter(onMethod_ = @Autowired) setter가 생성될 때 autowired를 붙여 자동관리 되도록 만듬
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	
//getList(리스트 타입의 데이터를 반환받음)
//	@Test
	public void testGetList() {
//forEach 구문으로 반복시켜 board라는 임시변수에 저장해서
//log.info(board) board의 내용을 출력한다.
	PageDTO page = new PageDTO(2,10);
	mapper.getList(page).forEach(board -> log.info(board));
	}
	
//	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setB_subject("게시판테스트");
		board.setB_name("관리자");
		board.setB_contents("--게시판 작성란 입니다!--");
//      테이블에 mapper를 이용하여 데이터 입력.
//		아래 문장을 실행시켜서 입력하고 나면, mysql이 b_num과 b_date값을 테이블에 입력시킨다.
		mapper.insert(board);	
	}
	
//	@Test
	public void testRead() {
		//Read test의 값을 저장할 객체 생성
		//글 num에 따른 값 출력
		BoardVO board = new BoardVO();
		board.setB_num(2);
		// read method는 mapper에서 반환값을 지정했기 때문에, 반환값을 담을 객체 필요. 
		// board에 덮어쓰기.
		board = mapper.read(board);
		//log 출력할 때 꼭 @Test 해준 다음에 run as실행하자.
		log.info(board);
	}	
	
	//@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setB_num(16);
		board.setB_subject("테스트2");
		board.setB_name("관리자2");
		board.setB_contents("--게시판 작성란 입니다!--");
		mapper.update(board);
	}
	//@Test
	public void testDelete() {
		BoardVO board = new BoardVO();
		board.setB_num(9);
//		board를 통채로 넘기면 거기서 9번을 찾아서 지움.
		mapper.delete(board);
	}
}
