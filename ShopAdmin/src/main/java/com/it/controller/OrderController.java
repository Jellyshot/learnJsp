package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/order/")
public class OrderController {
	
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
