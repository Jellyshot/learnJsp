package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.AdminVO;
import com.it.service.AdminService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/")
public class AdminController {
	
	//멤버변수 선언
	@Setter(onMethod_ = @Autowired)
	public AdminService service; 
	
	@GetMapping("/login")
	public void login() {
		//admin의 login페이지 호출
	}
	
	@PostMapping("/login")
	public String login(AdminVO admin, HttpSession session) {
		log.info(admin);
		boolean chk = service.auth(admin);
		if (chk == true) {
			session.setAttribute("a_id", admin.getA_id());
			log.info("관리자 로그인 성공");
			return "redirect:/";
		}else {
			log.info("관리자 로그인 실패");
			return "redirect:/admin/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 끊기. 관련된 모든 변수를 삭제함.
		return "redirect:/";
	}
	
}
