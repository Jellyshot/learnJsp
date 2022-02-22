package com.it.mapper;

import java.util.List;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.CartdetailDTO;
import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	
//	@Test
	public void getListMain() {
		mapper.getListMain().forEach(cartmain->log.info(cartmain));
	}
//	@Test
	public void getListSub() {
		mapper.getListSub().forEach(cartsub->log.info(cartsub));
	}
	
//	@Test
	public void readMain() {
		CartmainVO cartmain = new CartmainVO();
		cartmain.setCm_code(1004);
		cartmain = mapper.readMain(cartmain);
		log.info(cartmain);
	}
//	@Test
	public void readSub() {
		CartsubVO cartsub = new CartsubVO();
		cartsub.setCs_code(1010);
		cartsub = mapper.readSub(cartsub);
		log.info(cartsub);
	}
	
	
//	@Test
	public void insertMain() {
		CartmainVO cartmain = new CartmainVO();
		cartmain.setM_id("lion");
		mapper.insertMain(cartmain);
		log.info(cartmain);
	}
//	@Test
	public void insertSub() {
		CartsubVO cartsub = new CartsubVO();
		cartsub.setCm_code(1006);
		cartsub.setP_code(1004);
		cartsub.setCs_cnt(1);
		log.info(cartsub);
		mapper.insertSub(cartsub);
	}
	
//	@Test
	public void updateSub() {
		CartsubVO cartsub = new CartsubVO();
		cartsub.setCs_code(1007);
		cartsub.setCs_cnt(10);
		mapper.updateSub(cartsub);
	}
	
//	@Test
	public void deleteSub() {
		CartsubVO cartsub = new CartsubVO();
		cartsub.setCs_code(1010);
		mapper.deleteSub(cartsub);
	}
	
//	@Test
	public void deleteMain() {
		CartmainVO cartmain = new CartmainVO();
		cartmain.setCm_code(1006);
		mapper.deleteMain(cartmain);
	}

//	@Test
	public void testCartdetail() {
		CartmainVO cartmain = new CartmainVO();
		cartmain.setCm_code(1007);
		List<CartdetailDTO> cartdetail = mapper.getListCartDetail(cartmain);
		cartdetail.forEach(cd -> log.info(cd));
		//mapper.getListCartDetail(cartmain).forEach(aaa -> log.info(aaa));
//		for (CartdetailDTO detail : mapper.getListCartDetail(cartmain)) {
//			log.info(detail);
		}
		// cd 이자리는 아무거나 써도 됨! testCartdatail이 되지 않았던 이유! DTO에 에너테이션 Data를 하지 않아서! 값을 못가져옴! 
	
//	@Test
	public void testCartTotal() {
		CartmainVO cartmain = new CartmainVO();
		cartmain.setCm_code(1007);
		CartmemberDTO cartmember = mapper.getCartTotal(cartmain);
		log.info(cartmember);
	}
	}
  
