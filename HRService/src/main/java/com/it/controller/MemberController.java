package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.MemberVO;
import com.it.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/")
public class MemberController {

	@Setter(onMethod_=@Autowired)
	private MemberService memberservice;
	
	@PostMapping("/login")
	public String login(MemberVO member, HttpSession session) {
		
		MemberVO tmp = new MemberVO();
		tmp  = memberservice.read(member);
//		String resultmsg="";
		
		if (tmp.getM_pwd().equals(member.getM_pwd())){
			log.info("로그인 성공");
			session.setAttribute("m_code", tmp.getM_code());
			session.setAttribute("m_name", tmp.getM_name());
			return "redirect:/member/index";

			
		} else {
//			resultmsg="<script>alert('로그인 실패');location.href='/'</script>";
			log.info("비밀번호가 틀렸습니다");
			return "redirect:../";
		} //return resultmsg;
			
	}
	
	@GetMapping("/index")
	public String index(HttpSession session, Model model) {
		int m_code = (int)session.getAttribute("m_code");
		if (m_code < 0) {
			return "redirect:/";
		} else {
			model.addAttribute("totalcount", memberservice.gettotalcount());
			MemberVO member = new MemberVO();
			member.setB_code(1);
			model.addAttribute("head", memberservice.getmembercount(member));
			
			member.setB_code(2);
			model.addAttribute("seoul", memberservice.getmembercount(member));
			
			member.setB_code(3);
			model.addAttribute("busan", memberservice.getmembercount(member));
			
		} return "/member/index";
	}
}
