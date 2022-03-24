package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.CartdetailDTO;
import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;
import com.it.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService{

	@Setter(onMethod_=@Autowired)
	private CartMapper mapper;
	
	@Override
	public void cartinsert(CartmainVO cartmain, CartsubVO cartsub) {
		CartmainVO cm = new CartmainVO();
//		세션 아이디를 인수로 조회하여 cartmain(cm_code) 결과 반환(null 또는 레코드 1개여야함: cm_code존재여부확인)
//		세션 아이디 확인은 shopController에서 진행하였음. 💡아주아주 중요함 다시 체크!
		cm = mapper.readMainid(cartmain);
		
		//cm_code가 없을때
		if(cm==null){
			mapper.insertMain(cartmain);
//			cart_sub에 입력할 cm_code따오기
			cm = mapper.readMainid(cartmain);
			cartsub.setCm_code(cm.getCm_code());
			mapper.insertSub(cartsub);
//			log.info(cartsub); 서비스에서는 log가 안먹힌다!
			
		//cm_code가 있을때
		}else {
			//cm_code를 cartsub에 저장			
			cartsub.setCm_code(cm.getCm_code());
			CartsubVO cs = new CartsubVO();
			
			//cm_code와 p_code가 동일한 레코드를 검색하는 쿼리(readSubproduct)			
			cs = mapper.readSubproduct(cartsub);
			
			//동일한 p_code가 (장바구니에서)검색되지 않았다면,				
			if(cs==null) {
				mapper.insertSub(cartsub);
			//동일한 p_code가 (장바구니에서)검색 되었다면			
			}else {
				cs.setCs_cnt(cs.getCs_cnt() + cartsub.getCs_cnt());
				mapper.updateSub(cs);
			}

		}
	}	
	
// --------------------------- 장바구니 내역 조회 ------------------------------------
//		혼자해본거
//		public void cartinfo(CartmainVO cartmain, CartsubVO cartsub) {
//			CartmainVO cm = new CartmainVO();
//			cm = mapper.readMainid(cartmain);
//			cartsub.setCm_code(cm.getCm_code());
//			mapper.getListCart(cartsub);
//		}
	
//		mem_id가 들어있는 객체 구조인 cartmain을 파라미터로 받아서 CartmainVO타입으로 반환하는 readMainid 객체 생성
		@Override
		public CartmainVO readMainid(CartmainVO cartmain){
			cartmain = mapper.readMainid(cartmain);
			return cartmain; // m_id와 cm_code가 담긴 cartmain값을 반환
		}
		
		
//		코드중복 아닌가?
		@Override
		public List<CartsubVO> getListCart(CartmainVO cartmain){
//			내가 한거.....
//			CartmainVO cm = new CartmainVO();
//			cm = mapper.readMainid(cm);
//			cartsub.setCm_code(cm.getCm_code());
//			
//			CartsubVO cs = new CartsubVO();
//			cs.setCm_code(cm.getCm_code());
//			mapper.getListCart(cs).forEach(cs->log.info(cs)); // ?? 오류가 왜나징
			
			return mapper.getListCart(cartmain);
		}
		
		@Override
		public List<CartdetailDTO> getListCartDetail(CartmainVO cartmain){
			return mapper.getListCartDetail(cartmain);
		}
		
		
		@Override
		public CartmemberDTO getCartTotal(CartmainVO cartmain) {
			return mapper.getCartTotal(cartmain);
		}
		
		
		@Override
		public void updateSub(CartsubVO cartsub) {
			mapper.updateSub(cartsub);
		}// 업데이트니까 반환값 필요 없음.
		
		
		@Override
		public void deleteSub(CartsubVO cartsub) {
			mapper.deleteSub(cartsub);
//			cs_code로 cartsub를 지우고
			CartmainVO cartmain = new CartmainVO();
			cartmain.setCm_code(cartsub.getCm_code());
//			cm_code로 cartsub의 레코드를 리스트로 불러오는 mapper를 실행하여 tmp에 저장
//			cartsub의 레코드가 하나도 없을시, cartmain 삭제 
			List<CartsubVO> tmp = mapper.getListCart(cartmain);
//			List구조이기 때문에 value가 null일수가 없다. 따라서 size를 사용하였음.
			if(tmp.size() == 0) {
				mapper.deleteMain(cartmain);
			}
		}
		
		
		@Override
		public void deletesuball(CartmainVO cartmain) {
			mapper.deletesuball(cartmain);
			mapper.deleteMain(cartmain);
		}
}	
