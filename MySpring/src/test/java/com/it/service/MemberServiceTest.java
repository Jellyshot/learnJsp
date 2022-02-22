package com.it.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTest {
	@Setter(onMethod_=@Autowired)
	private MemberService service;
	
//	@Test
	public void testRead() {
		MemberVO member = new MemberVO();
		member.setM_id("delete");
		member = service.read(member);
		log.info(member);
	}
//	@Test
	public void testauth() {
		MemberVO member = new MemberVO();
		member.setM_id("duck");
		member.setM_passwd("123");
		service.auth(member); // MemberServiceimpl에 이미 true, false값을 출력하므로 따로 log는 처리하지 않음
	}
//	@Test
	public void testGetList() {
		//forEach구문에 인스턴스변수 member는 아무거나 넣어줘도 됨.
		service.getList().forEach(member->log.info(member));
	}
//	@Test
	public void testInsert() {
		MemberVO member = new MemberVO();
		member.setM_id("bird");
		member.setM_name("오목눈이 뱁새");
		member.setM_passwd("1234");
		service.insert(member);
		log.info(member);
	}
//	@Test
	public void testUpdate() {
		MemberVO member = new MemberVO();
		member.setM_id("bird");
		member.setM_name("오목눈이 뱁새");
		member.setM_passwd("1234");
		service.update(member);
		log.info(member);
	}
//	@Test
	public void testDelete() {
		MemberVO member = new MemberVO();
		member.setM_id("delete");
		service.delete(member);
		log.info(member);
	}
}
