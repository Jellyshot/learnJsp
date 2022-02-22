package com.it.service;

import java.util.List;

import com.it.domain.CartdetailDTO;
import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;

public interface CartService {
	
//	shop list에서 장바구니 버튼을 누르면 정보가 넘어오게 만들기
	
	public void cartinsert(CartmainVO cartmain, CartsubVO cartsub);
	
//	장바구니를 조회하기 위해 id로 cm_code를 검색하는 인터페이스를 만드려면 m_id가 담긴 cartmainVO가방이 필요함.
	public CartmainVO readMainid(CartmainVO cartmain);
	
//	readMainid에서 리턴받은 cartmain의 cm_code를 사용하여 장바구니의 내용을 조회하는 getListCart 생성
	public List<CartsubVO> getListCart(CartmainVO cartmain);
	
	public List<CartdetailDTO> getListCartDetail(CartmainVO cartmain);
	
	public CartmemberDTO getCartTotal(CartmainVO cartmain);
	
	public void updateSub(CartsubVO cartsub);
	
	public void deleteSub(CartsubVO cartsub);
	
	public void deletesuball(CartmainVO cartmain);
}

