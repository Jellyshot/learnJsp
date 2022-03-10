package com.it.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.AdminVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Test
	public void testRead() {
		AdminVO admin = new AdminVO();
		admin.setA_id("admin");
		admin.setA_passwd("1234");
		//자바는 꼭꼭 String을 큰따옴표로 묶어줘야함!
		//테스트를 위해, read한 값을 admin에 넣고 log찍어줌
		admin = mapper.read(admin);
		log.info(admin);
	}

}
