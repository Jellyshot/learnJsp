package com.it.mapper;

import java.util.List;

import com.it.domain.CartdetailDTO;
import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;

public interface CartMapper {
/*	Cartmain과 Cartsub의 데이터를 읽어들임
 * 	보통 Mapper에서는 List로 전체 데이터를 가지고 왔는데 지금은 테이블을 두개에서 데이터를 불러와야 하므로
 *  인터페이스에서의 객체 선언도 Main과 Sub로 나누어 구분함 */
	
	public List<CartmainVO> getListMain();
	public List<CartsubVO> getListSub();
	
// readmainid를 통해 cartmain을 반환하여, 그 값을 파라미터로 getListCart를 이용할것이므로 가방에는 cartmain이 들어가야함	
	public List<CartsubVO> getListCart(CartmainVO cartmain);

//	product와 cartsub를 조인시킬 맵퍼
	public List<CartdetailDTO> getListCartDetail(CartmainVO cartmain);
	
//	총금액 전달
	public CartmemberDTO getCartTotal(CartmainVO cartmain);
	
	public CartmainVO readMain(CartmainVO cartmain);
	public CartsubVO readSub(CartsubVO cartsub);
	public CartmainVO readMainid(CartmainVO cartmain);
	public CartsubVO readSubproduct(CartsubVO cartsub); 
	
	public void insertMain(CartmainVO cartmain);
	public void insertSub(CartsubVO cartsub);
	
	public void updateMain(CartmainVO cartmain);
	public void updateSub(CartsubVO cartsub);
	
	public void deleteMain(CartmainVO cartmain);
	public void deleteSub(CartsubVO cartsub);
	public void deletesuball(CartmainVO cartmain);
	
	
}
