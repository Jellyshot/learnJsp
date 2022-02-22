package com.it.service;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.it.domain.ProductVO;
import com.it.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTest {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
//	@Test
	public void testGetList() {
		mapper.getList().forEach(product->log.info(product));
	}
	
//	@Test
	public void testInsert() {
		ProductVO product = new ProductVO();
		product.setP_name("핫식스");
		product.setP_price(2000);
		
		log.info(product);
		mapper.insert(product);
	}
//	@Test
	public void testRead() {
		ProductVO product = new ProductVO();
		product.setP_code(1006);
		product = mapper.read(product);
		log.info(product);
	}
	
//	@Test
	public void testUpdate() {
		ProductVO product = new ProductVO();
		product.setP_code(1007);
		product.setP_name("몬스터");
		product.setP_price(2200);
		
		mapper.update(product);
	}
	
//	@Test
	public void testDelete() {
		ProductVO product = new ProductVO();
		product.setP_code(1007);
		
		mapper.delete(product);
	}
}
