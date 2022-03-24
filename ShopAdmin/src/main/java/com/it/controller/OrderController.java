package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String list(HttpSession session){
		String a_id = (String)session.getAttribute("a_id");
		if (a_id == null) {
			return "redirect:/admin/login";
		} else {
			return "/order/list";
			
			
		}
	}
	
}
