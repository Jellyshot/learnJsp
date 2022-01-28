package com.it.mapper;

import org.junit.Test;
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
public class MemberMapperTest {
//	테스트를 위해 MemberMapper를 선언하여 mapper 객체를 생성
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	
//getList(리스트 타입의 데이터를 반환받음)
	@Test
	public void testGetList() {
	//forEach 구문으로 반복시켜 member라는 임시변수에 저장해서
	//log.info(member) member의 내용을 출력한다. 
	mapper.getList().forEach(member -> log.info(member));
	}
	
//	@Test
	public void testInsert() {
		MemberVO member = new MemberVO();
		member.setM_id("professor");
		member.setM_name("황교수님");
		mapper.insert(member);
	}
	
//	@Test
	public void testRead() {
		MemberVO member = new MemberVO();
		member.setM_id("tiger");
		member = mapper.read(member);
		log.info(member);
	}	
	
//	@Test
	public void testUpdate() {
		MemberVO member = new MemberVO();
		member.setM_id("professor");
		member.setM_name("황교수님");
		mapper.update(member);

	}
//	@Test
	public void testDelete() {
		MemberVO member = new MemberVO();
		member.setM_id("professor");
		mapper.delete(member);
	}

}
