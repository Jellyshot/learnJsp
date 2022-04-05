package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.CartmainVO;
import com.it.domain.CartmemberDTO;
import com.it.domain.CartsubVO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermemberDTO;
import com.it.domain.PageDTO;
import com.it.service.CartService;
import com.it.service.MemberService;
import com.it.service.OrderService;
import com.it.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/")
public class ShopController {

//	참조할 서비스들 가져오기
	@Setter(onMethod_ = @Autowired)
	private ProductService productservice;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberservice;
	
	@Setter(onMethod_ = @Autowired)
	private CartService cartservice;
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderservice;
	
	
//	상품 진열시키기
	@GetMapping("/list")
	public void list(Model model, PageDTO page) {
		model.addAttribute("list", productservice.getList(page));
	}
	
//	장바구니 버튼을 누를때 m_id값을 가져오기 위한 session(HomeController에서 만들었음)가방 처리
	@PostMapping("/cart")
	public String cart(CartsubVO cartsub, HttpSession session) {
		log.info(cartsub);
		
		String m_id = (String)session.getAttribute("m_id");
		
		if(m_id != null) {
			CartmainVO cartmain = new CartmainVO();
			cartmain.setM_id(m_id); // VO에 사용자의 세션정보를 저장
			cartservice.cartinsert(cartmain, cartsub);
			log.info("장바구니에 물건을 담았습니다.");
			
			return "redirect:/shop/cartinfo"; 
			
		}else {
			log.info("로그인이 필요합니다.");
			return "redirect:/member/login";
		}
	}
	
	//-------------------장바구니 보여주기------------------------
	//세션이 존재 해야만, 장바구니의 내역을 조회할 수 있도록 체크하는 기능 추가.	
	//필요정보 : cm_code . cm_code를 알아내는 방법	
	//mapper의 readmainid(cartmain에서 m_id로 검색)와 getlistCart를 사용
	
	@GetMapping("/cartinfo") // jsp파일은 carinfo.jsp 가되겠습니다.
	public String cartinfo(Model model, HttpSession session) {
		
		// 1.로그인 상태 확인 		
		String m_id = (String)session.getAttribute("m_id");
		String m_name = (String)session.getAttribute("m_name");
		
		// 2. 로그인 중이면		
		if(m_id != null) {
			log.info("로그인 중입니다.");
			
		// 2.2 해당 세션 m_id값으로 장바구니 내역 조회하기 위해 cm_code를 추출
			CartmainVO cartmain = new CartmainVO();
			cartmain.setM_id(m_id); // VO에 사용자의 세션정보를 저장
			cartmain = cartservice.readMainid(cartmain); // 위에서 만든 가방에 service의 readmainid를 이용하여 값을 불러와서 덮어씀
			
			// 2.3 cartmain의 cm_code값이 조회가 되면 	
			if (cartmain != null) {
//				cartservice.getListCart(cartmain).forEach(cartsub->log.info(cartsub));
				// getListCart의 내용을 list에 담아 cartinfo.jsp에 뿌려줌				
				// 애는 리스트타입이고				
				model.addAttribute("list", cartservice.getListCartDetail(cartmain));
				
/*				이미 cartmain에 이름이랑 id가 들어있눈거아니얌? 그건 들어있는데, 가장 중요한 total금액이 안들어있음. 
 * 				그래서 total이 들어있는 CartmemberDTO 가방을 꼭 만들어 주어야 함.
 * 				DTO는 단일레코드 타입임.  */
				
				CartmemberDTO carttotal = cartservice.getCartTotal(cartmain);
				carttotal.setCm_code(cartmain.getCm_code());
				carttotal.setM_id(m_id);
				carttotal.setM_name(m_name);
//				getCartTotal에는 총 합계금액만 들어있기 때문에 전달하기 전에 나머지 값을 가지고 와야함.
				model.addAttribute("carttotal", carttotal);
				model.addAttribute("cm_code", cartmain.getCm_code()); // cartmain에 담긴 cm_code를 전달하여 삭제확인
				
			// 2.4 cm_code값이 조회되지 않으면,			
			}else {
				log.info("장바구니에 담긴 상품이 없습니다.");
			}
			return "/shop/cartinfo"; 
			//redirect가 없이 리턴으로 url을 주면 jsp페이지로 바로 이동함. 
			/*로그인 값이 없을때 로그인페이지로 보내기 위해 else에 String을 줌으로써, 이곳에도 return을 해주어야함
			 * 다만, 여기서 redirect를 주면, 이미 컨트롤러 페이지 인데, 다시 컨트롤러를 거치게 하면 	위에 if문에 했던 작업을
			 *  중복으로 또 처리하게 되므로 바로 jsp파일로 보낸다. */
			
		// 3. 로그인(세션)값이 없으면,
		}else {
			log.info("로그인이 필요합니다.");
			return "redirect:/member/login"; // 컨트롤러의 메서드를 호출 후에 jsp로 이동(컨트롤러를 거쳐감)
		}
	}
	
	
	@PostMapping("/cartupdate")
	public String updateSub(CartsubVO cartsub) {
		cartservice.updateSub(cartsub);
		log.info("-----장바구니 업데이트-----");
		return "redirect:/shop/cartinfo";
	}
	
	@GetMapping("/cartdelete")
	public String cartdelete(CartsubVO cartsub) {
		cartservice.deleteSub(cartsub);
		log.info("장바구니 상품이 삭제되었습니다.");
		return "redirect:/shop/cartinfo";
	}
	
	@GetMapping("/cartdeleteall")
	public String cartdeletesuball(CartmainVO cartmain) {
		cartservice.deletesuball(cartmain);
		return "redirect:/shop/cartinfo";
	}
	
//	------------- 주문 진행 -----------------
	
	@GetMapping("/address")
	public String address(HttpSession session, CartmainVO cartmain) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id==null) {
			return "/member/login";
		} else {
			cartmain.getCm_code();
			return "/shop/address";
		}
	}
	@PostMapping("/address")
	public String address(HttpSession session, CartmainVO cartmain, Model model) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id==null) {
			return "/member/login";
		} else {
			
			return "redirect:/shop/orderinfo";
		}
	}
	
	@GetMapping("/orderinfo")
	public String orderinfo(HttpSession session, CartmainVO cartmain, Model model) {
		//1. 로그인 확인 후		
		String m_id = (String)session.getAttribute("m_id");
		String m_name = (String)session.getAttribute("m_name");
		//2. 로그인 중이면		
		if(m_id != null) {
			cartmain.setM_id(m_id);
			OrdermainVO ordermain = orderservice.orderproce(cartmain);
			
			//orderinfo.jsp에 내용을 전달함. ordersub의 내용이 저장되어 있는 변수 생성
			//요기는 내가 해본거. 이렇게 해도 되긴함.			
			//OrdermainVO ordermain = new OrdermainVO();
			//ordermain.setM_id(m_id);
			//ordermain = orderservice.readMainid(ordermain);
			
			model.addAttribute("list", orderservice.getListOrderDetail(ordermain));
			// 여기서 redirect:를 쓰게 되면, Controller를 재실행하고 다시 여기로 내려와서 또 컨트롤러를 재시작하면서 무한루프의 늪에 빠짐 ^^ 
			
			OrdermemberDTO ordertotal = orderservice.getOrderTotal(ordermain);
//			log.info(ordertotal); 
			ordertotal.setM_id(m_id);
			ordertotal.setM_name(m_name);
			ordertotal.setOm_code(ordermain.getOm_code());
			model.addAttribute("ordertotal", ordertotal);
			
			log.info("---구매가 완료되었습니다---");
			
			return "/shop/orderinfo";  
			
		}else {
		//3. 로그인한 상태가 아니면
			return "/member/login";
		}
	}
	
	
}
