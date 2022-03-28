package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.OrdermanageDTO;
import com.it.domain.PageDTO;
import com.it.domain.PageviewDTO;
import com.it.service.CartService;
import com.it.service.MemberService;
import com.it.service.OrderService;
import com.it.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/order/")
public class OrderController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService productservice;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberservice;
	
	@Setter(onMethod_ = @Autowired)
	private CartService cartservice;
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderservice;
	
	@GetMapping("/list")
	public String list(HttpSession session, PageDTO page, Model model){
		String a_id = (String)session.getAttribute("a_id");
		if (a_id == null) {
			return "redirect:/admin/login";
		} else {
			model.addAttribute("list", orderservice.ordermanage(page));
			
			int total = orderservice.getTotalCount();
			PageviewDTO pageview = new PageviewDTO(page, total);
			model.addAttribute("pageview", pageview);
			
			return "/order/list";
		}
	}
	
	@PostMapping("/update")
	public String list(HttpSession session, OrdermanageDTO ordermanage) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		} else {
			orderservice.statusupdate(ordermanage);
		}return "";
	}
		
	
}
