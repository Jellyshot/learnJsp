package com.it.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.MemberVO;
import com.it.domain.OrdermainVO;
import com.it.domain.PageDTO;
import com.it.domain.PageviewDTO;
import com.it.service.MemberService;
import com.it.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	public MemberService memberservice;
	
	@Setter(onMethod_ = @Autowired)
	public OrderService orderservice;
	
	@GetMapping("/login")
	public void login() {
		
	}
	@PostMapping("/login")
	public String login(MemberVO member, HttpSession session, HttpServletResponse response) {
		log.info(member);
		boolean chk = memberservice.login(member);
		if(chk==true) {
			session.setAttribute("m_id", member.getM_id());
			log.info(member.getM_id()+"로그인 성공");
			return "redirect:../";
			
		} else {
			return "redirect:/member/login";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../";
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		} else {
			OrdermainVO ordermain = new OrdermainVO();
			ordermain.setM_id(m_id);
			ordermain = orderservice.readMainid(ordermain);
			log.info("ordermanage: " +  orderservice.ordermanage(ordermain));
			model.addAttribute("ordermanage", orderservice.ordermanage(ordermain));
			
			return "/member/mypage";
			
		}
	}
	
	@GetMapping("/list")
	public String list(Model model, PageDTO page, HttpSession session) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id ==null) {
			return "redirect:/member/login";
		} else {
			model.addAttribute("list", memberservice.getList(page));
			int total = memberservice.getTotalCount();
			
			PageviewDTO pageview = new PageviewDTO(page,total);
			model.addAttribute("pageview", pageview);
		} return "/member/list"; 
	}
	
	@GetMapping("/regist")
	public void insert(HttpSession session) {
		
	}
	
	@PostMapping("/insert")
	public String insert(HttpSession session, MemberVO member) {
			log.info(member);
			MemberVO tmp = new MemberVO();
			tmp = memberservice.read(member);
			if(tmp==null) {
				memberservice.insert(member);
				return "redirect:/member/login";
			} else {
				log.info("동일한 아이디가 존재합니다");
				return "/member/insert";
			}
	}
	
	@GetMapping("/view")
	public String view(HttpSession session, MemberVO member, Model model, PageDTO page) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		}else {
			member = memberservice.read(member);
			model.addAttribute("member", member);
			model.addAttribute("page", page);
			return "/member/view";
		}
	}
	
	@GetMapping("/update")
	public String update(HttpSession session, MemberVO member, Model model, PageDTO page) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		}else {
			member.setM_id(m_id);
			member = memberservice.read(member);
			log.info(member);
			model.addAttribute("member", member);
			model.addAttribute("page", page);
		}
		return "/member/update";
	}
	
	@PostMapping("/update")
	public String update(HttpSession session, MemberVO member, PageDTO page) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		}else {
			log.info(member.getM_name()+"님의 회원정보 업데이트");
			memberservice.update(member);
			return "redirect:/member/view/?m_id="+member.getM_id()+"&pageNum="+page.getPageNum();
		}
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session, MemberVO member) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		}else {
			memberservice.delete(member);
			return "redirect:/member/list";
		}
	}
	
	@GetMapping("/upasswd")
	public String upasswd(HttpSession session, MemberVO member) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		}else{
			memberservice.upasswd(member);
			return "redirect:/member/list";
		}
	}
	
	
}
