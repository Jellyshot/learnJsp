package com.it.mapper;

import java.util.List;

import com.it.domain.CartdetailDTO;
import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;

public interface CartMapper {

	public List<CartmainVO> getListMain();
	public void insertMain (CartmainVO cartmain);
	public CartmainVO readMain (CartmainVO cartmain);
	public CartmainVO readMainid (CartmainVO cartmain);
	public void deleteMain (CartmainVO cartmain);
	
	//cartsub전체 조회
	public List<CartsubVO> getListSub();
	//cartsub id로 조회
	public List<CartsubVO> getListCart();
	
	public void insertSub (CartsubVO cartsub);
	//cs_code로 장바구니 전체 조회
	public CartsubVO readSub (CartsubVO cartsub);
	//cm_code로 장바구니의 아이템 존재 유무 조회 (동일제품 존재시 cnt만 변경)
	public CartsubVO readSubproduct (CartsubVO cartsub);
	
	public void updateSub (CartsubVO cartsub);
	//cs_code로 데이터 삭제
	public void deleteSub (CartsubVO cartsub);
	//cm_code로 데이터 삭제
	public void deletesuball(CartmainVO cartmain);
	
//	조인 테이블
	//장바구니 상세보기
	public List<CartdetailDTO> getListCartDetail(CartmainVO cartmain);
	//장바구니 멤버별 총 금액 전달
	public CartmemberDTO getCartTotal(CartmainVO cartmain);
	
	
	
	
}
;