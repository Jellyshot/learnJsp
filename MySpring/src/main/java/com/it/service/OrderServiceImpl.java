package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.CartmainVO;
import com.it.domain.CartsubVO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdersubVO;
import com.it.mapper.CartMapper;
import com.it.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderServiceImpl implements OrderService{
	
	@Setter(onMethod_ =@Autowired)
	private OrderMapper ordermapper;
	
	@Setter(onMethod_ =@Autowired)
	private CartMapper cartmapper;

	
	
	@Override
	public void orderproce(CartmainVO cartmain) {
//	orderprocedure에서 진행할것
//		1. ordermain insert
			OrdermainVO ordermain = new OrdermainVO();
			ordermain.setM_id(cartmain.getM_id());
			ordermapper.insertmain(ordermain);
			
//		2. 방금 생성한 om_code 조회
		 ordermain = ordermapper.readMainid(ordermain);
		 
// 		3. cm_code를 사용하여 cartsub를 조회하여 ordersub에 데이터 insert
		 // for	루프를 사용하여 데이터를 불러오면서 해당값을 ordermain에 insert시킴
		 List<CartsubVO> cartsub = cartmapper.getListCart(cartmain);
		 for(CartsubVO item : cartsub) {
			 OrdersubVO ordersub = new OrdersubVO();
			 ordersub.setOm_code(ordermain.getOm_code());
			 ordersub.setP_code(item.getP_code());
			 ordersub.setOs_cnt(item.getCs_cnt());
			 ordermapper.insertsub(ordersub);
		 }
//		5. cartsub삭제(cm_code 활용)
		 	cartmapper.deletesuball(cartmain);
//			cs_code로 cartsub를 지우고
//		6. cartmain삭제
		 	cartmapper.deleteMain(cartmain);
			
				
	}
}
