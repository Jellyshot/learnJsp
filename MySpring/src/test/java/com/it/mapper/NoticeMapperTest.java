package com.it.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// 1. 테스트 진행을 위해 test 어노이먼스 세개 지정해 주고
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTest {

	
// 2. 테스트를 실행할 임시객체 선언
/*	  NoticeMapper를 문자열로 가지는 mapper 선언.
 * 	  NoticeMapper의 메서드를 사용할 수 있게 함. 
 */
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;

	
// 3. 테스트 시작
//	@Test
	public void testGetList() {
		mapper.getList().forEach( notice-> log.info(notice));
	}
//	@Test
	public void testRead() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(1);
		notice = mapper.read(notice);
//		n_num1을 준 notice를 mapper를 통해 읽어온 데이터를 notice에 저장 후
		log.info(notice);
	}
//	@Test
	public void testInsert() {
		NoticeVO notice = new NoticeVO();
		notice.setN_name("테스트2");
		notice.setN_subject("생성테스트입니다2");
		notice.setN_contents("삭제테스트를위한");
		mapper.insert(notice);
	}
//	@Test
	public void testUpdate() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(1);
		notice.setN_name("이름은왜");
		notice.setN_subject("테스트2");
		notice.setN_contents("수정테스트입니다.");
		mapper.update(notice);
	}
//	@Test
	public void testDelete() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(3);
		mapper.delete(notice);
	}
}
