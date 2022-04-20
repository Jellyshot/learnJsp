package com.it.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	@GetMapping("/login")
	public void login() {
		
	}
	@PostMapping("/login")
	public String login(MemberVO member, HttpSession session, HttpServletResponse response) {
		log.info(member);
		/* boolean chk = memberservice.login(member); */
		MemberVO tmp = new MemberVO();
		tmp = memberservice.read(member);
		if(tmp == null) {
			log.info("등록된 아이디가 없습니다");
			return "redirect:/member/login";
		} else {
			boolean chk = passwordEncoder.matches(member.getM_passwd(), tmp.getM_passwd());
			if(chk==true) {
				session.setAttribute("m_id", member.getM_id());
				log.info(member.getM_id()+"로그인 성공");
				return "redirect:../";
			}
		}
		log.info("아이디와 비밀번호가 일치하지 않습니다.");
		return "redirect:/member/login";
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
//			ordermain = orderservice.readMainid(ordermain);
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
	public @ResponseBody String insert(HttpSession session, MemberVO member) {
			log.info(member);
			MemberVO tmp = new MemberVO();
			tmp = memberservice.read(member);
			if(tmp==null) {
				member.setM_passwd(passwordEncoder.encode(member.getM_passwd()));
				memberservice.insert(member);
				return "<script>alert('Success!'); location.href='/member/login'</script>";
						/* "redirect:/member/login";*/
			} else {
				log.info("동일한 아이디가 존재합니다");
				return "<script>alert('Fail. Check ID'); location.href='/member/regist'</script>";
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
			return "redirect:/member/view/?m_id="+member.getM_id();
		}
	}
	
	/*
	@GetMapping("/delete")
	public @ResponseBody String delete(HttpSession session, MemberVO member) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		}else {
			
			return "<script>confirm('정말 삭제하시겠습니까? 데이터를 복구할 수 없습니다'); location.href='/member/deleteconfirm';</script>";
			
//			그냥 session.invalidate를 했을때는, 뒤로가기등을 하면 세션정보가 다시 불러져 왔지만,
//  			ServletRequest를 통해 세션을 불러와 무효화 시킨 후 새로운 세션 ID를 생성해주면 완전히 끊김! 

		}
	}
	*/
	
	@GetMapping("/delete")
	public void delete(HttpSession session, MemberVO member, HttpServletResponse response) throws Exception{
		 response.setContentType("text/html; charset=euc-kr");
         response.setCharacterEncoding("euc-kr");
         PrintWriter out = response.getWriter();

		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			out.println("redirect:/member/login");
		}else {
			
			out.println("<script>confirm('정말 삭제하시겠습니까? 데이터를 복구할 수 없습니다'); location.href='/member/deleteconfirm';</script>");
			out.flush();
//			그냥 session.invalidate를 했을때는, 뒤로가기등을 하면 세션정보가 다시 불러져 왔지만,
//  			ServletRequest를 통해 세션을 불러와 무효화 시킨 후 새로운 세션 ID를 생성해주면 완전히 끊김! 

		}
	}
	
	
	@GetMapping("/deleteconfirm")
	public String deleteconfirm(HttpSession session, OrdermainVO ordermain, HttpServletRequest request) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		}else {
			ordermain.setM_id(m_id);
			orderservice.deleteid(ordermain);
			
			
			MemberVO member = new MemberVO();
			member.setM_id(m_id);
			memberservice.delete(member);
			request.getSession().invalidate();
			request.getSession(true);
			return "redirect:/";
		}
	}
	
	@GetMapping("/upasswd")
	public String upasswd(HttpSession session, MemberVO member, Model model) {
		String m_id = (String)session.getAttribute("m_id");
		if(m_id == null) {
			return "redirect:/member/login";
		}else{
			model.addAttribute("m_id", member.getM_id());
			return "/member/upasswd";
		}
	}
	
	@PostMapping("/upasswd")
	public String upasswd(MemberVO member) { 
		log.info("비밀번호수정 정보"+member);
		member.setM_passwd(passwordEncoder.encode(member.getM_passwd()));
		memberservice.upasswd(member);
		return "redirect:/member/mypage?m_id="+member.getM_id();
	}
	

	
	
}
