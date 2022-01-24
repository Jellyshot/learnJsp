package com.it.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTest {

// 1. NoticeService의 메서드를 사용해 Test를 진행하기 위한 임시객체 service생성 및 자동생성 어노이먼스 선언
	@Setter(onMethod_=@Autowired)
	private NoticeService service;
	
// 2. 테스트 진행
//	@Test
	public void testGetList() {
		service.getList().forEach(service->log.info(service));
	}
	
//	@Test
	public void testRead() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(1);
		notice = service.read(notice);
		log.info(notice);
	}
//	@Test
	public void testInsert() {
		NoticeVO notice = new NoticeVO();
		notice.setN_name("산타할아버지");
		notice.setN_subject("설날에는");
		notice.setN_contents("휴가 어디가세요?");
		service.insert(notice);
	}
	
//	@Test
	public void testUpdate() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(1);
		notice.setN_name("테스트"	);
		notice.setN_subject("서비스 테스트");
		notice.setN_contents("잘작동되나요?");
		service.update(notice);
		log.info(notice);
	}
	
	@Test
	public void testDelete() {
		NoticeVO notice = new NoticeVO();
		notice.setN_num(1);
		service.delete(notice);
	}
}
