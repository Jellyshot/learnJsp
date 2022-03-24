package com.it.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.MemberVO;
import com.it.domain.PageDTO;
import com.it.domain.PageviewDTO;
import com.it.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	public MemberService service;
	
	@GetMapping("/list")
	public String list(Model model, PageDTO page, HttpSession session) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id ==null) {
			return "redirect:/admin/login";
		} else {
			model.addAttribute("list", service.getList(page));
			int total = service.getTotalCount();
			
			PageviewDTO pageview = new PageviewDTO(page,total);
			model.addAttribute("pageview", pageview);
		} return "/member/list"; 
	}
	
	@GetMapping("/insert")
	public String insert(HttpSession session) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		} else {
			return "/member/insert";
		}
	}
	
	@PostMapping("/insert")
	public String insert(HttpSession session, MemberVO member) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		}else {
			service.insert(member);
		}return "redirect:/member/list";
	}
	
	@GetMapping("/view")
	public String view(HttpSession session, MemberVO member, Model model, PageDTO page) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		}else {
			member = service.read(member);
			model.addAttribute("member", member);
			model.addAttribute("page", page);
			return "/member/view";
		}
	}
	
	@GetMapping("/update")
	public String update(HttpSession session, MemberVO member, Model model, PageDTO page) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		}else {
			member = service.read(member);
			model.addAttribute("member", member);
			model.addAttribute("page", page);
		}
		return "/member/update";
	}
	
	@PostMapping("/update")
	public String update(HttpSession session, MemberVO member, PageDTO page) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		}else {
			log.info(member.getM_name()+"님의 회원정보 업데이트");
			service.update(member);
			return "redirect:/member/view/?m_id="+member.getM_id()+"&pageNum="+page.getPageNum();
		}
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session, MemberVO member) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		}else {
			service.delete(member);
			return "redirect:/member/list";
		}
	}
	
	@GetMapping("/upasswd")
	public String upasswd(HttpSession session, MemberVO member) {
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
		}else{
			service.upasswd(member);
			return "redirect:/member/list";
		}
	}
	
	
}
