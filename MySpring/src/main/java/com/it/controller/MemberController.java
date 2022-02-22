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

@Controller
@Log4j
@RequestMapping("/member/")
public class MemberController {
	

	@Setter(onMethod_ = @Autowired)
	private MemberService service;


//	process부분에서는 return: "redirect:"; 를 하고, 나머지에서는 model.Attribute를 사용한다.	
//	process 파일 따로 필요 없이 controller에서 처리한다. jsp파일은 폼 부분만 있으면 됨.
// ---------------------   Read  ------------------------------
	@GetMapping("/list")
	public void list(Model model) {
		// Model : jsp로 데이터를 전달해주는 Controller 내장 객체. 주로 VO객체를 저장함.
		// Tomcat 실행.
		// Member 폴더로 가서 list.jsp 를 만들어 줌 그럼 이제 list.jsp로 가게됨.
		// model의 속성인 addAttribute를 사용하여 list라는 인스턴스변수에 getList한 데이터를 list.jsp에 전달
		model.addAttribute("list", service.getList());
		// list.jsp에서는 item="${list}"로 내용을 받음.
	}
	
// ---------------------- Create -------------------------------
	@GetMapping("/insert")
	public void insert() {
		// form이 들어간 package를 호출만 함.
	}
	// 앞에 form action에 /Member/insert를 지정해 놓았으므로 insert중 하나로 들어오는데, form method가
	// post임으로 form의 input 태그의 name과 MemberVO의 멤버변수 이름에 맞추어 postMapping의 Member변수에 저장된다.  
	@PostMapping("/insert")
	public String insert(MemberVO member) {
		log.info("----------글쓰기 시작----------");
		log.info(member);
		service.insert(member);
		log.info("----------글쓰기 완료----------");
	//	입력 완료 후 '컨트롤러를 거쳐서' 페이지 이동시키기 -> redirect:를 url 앞에 써줌		
		return "redirect:/Member/list";
	}// form에서 제출 버튼을 누르면 Member에 log.info처리된것들이 insert됨

	
	//앞서 list에서 num값을 get방식으로 가져와 view링크로 온 것에 대한 역할을 구현함.(두개 이상넘길때는 & 사용) 
	//역할은 구혔으나, 보여줄 페이지가 없으므로 view.jsp 역시 만들어 줘야 함
	//log.info를 이용하여 list.jsp를 클릭했을 때 b_num이 제대로 넘어가는지 console로그 확인(디버깅)
	
	
//	------------------- 수정, 삭제를 위한 view ---------------------------
	@GetMapping("/view")
	public void view(MemberVO member, Model model) {
		log.info("-----view num 확인-----");
		log.info(member); //여기서 Member에는 list에서 받은 b_num값이 들어 있음.
		member = service.read(member); 
		log.info("-----view num에 따른 read 확인-----");
		log.info(member);
		
	/*	read 로 Member변수에 값을 담았으므로, Member변수에 있는 값을 name="Member"로 넘김.
	 *  값을 넘길때는 model.addAttribute(String, object)를 사용하고, 페이지를 이동시킬때는 redirect:url을 사용.
	 *  addAttribute는 값만 넘겨주고 끝이므로 리턴값이 필요 없지만, redirect:url은 메세지 출력해야 하니까 return값이 있음? 
	 *  그래서 void가 아니라 string을 써줘야함. 맞니?
	 *  model의 속성인 addAttribute를 사용하여 Member라는 인스턴스변수에 Member객체에 담은 데이터를 전달
	 */
		model.addAttribute("member",member);	
//		view.jsp에서는 item="${member}"로 내용을 받음.
	}
	
	
//	------------------------ Update ------------------------------------
//	view에서 넘겨준 b_num값으로 데이터를 update(form)에 불러옴.
	@GetMapping("/update")
	public void update(MemberVO member, Model model) {
		log.info("-----update num 확인-----");
		log.info(member);
		member = service.read(member);
		log.info("-----update 데이터 확인-----");
		log.info(member);
		model.addAttribute("member", member);
		//Attribute(전달해줄 명칭, 전달할 객체)		
	}
	
//	form에서 수정버튼을 누르면 작동하는 코드 작성 (update_process 리턴 필요)
	@PostMapping("/update")
	public String update(MemberVO member) {
		log.info("---------앞에서 받아온 update할 데이터 확인----------");
		log.info(member);
		service.update(member);
		return "redirect:/member/view?m_id=" + member.getM_id();		
	}
	
//	------------------------ Delete ------------------------------	
	@GetMapping("/delete")
	public String delte(MemberVO Member) {
		log.info("-----삭제-----");
		service.delete(Member);
		return "redirect:/member/list";
	}
	
//	------------------------- 로그인 -----------------------------
	@GetMapping("/login") 
	public void login() {
//		로그인 페이지(form) 호출
	}
	
	@PostMapping("/login")
	public void login(MemberVO member, HttpSession session) {
// 💡 HttpSession : php에서 session start 같은거인듯. 이제 세션 변수 만들거야! 이런거
		
		log.info(member);
//		체크라는 변수에 auth 메서드를 실행시키는것을 저장함
		boolean chk = service.auth(member);

		if(chk == true) {
			member = service.read(member); 
			// member에는 login창에서 post로 받은 값이들어있는데, service에서 만든 read method는 아이디값을 받아 해당 아이디값의 정보를 읽어옴. 여기서 name값을 받아 session 처리함.
			session.setAttribute("m_id", member.getM_id());
			session.setAttribute("m_name", member.getM_name());
			//"m_id"라는 변수명으로 member에 담긴 정보 중 m_id를 세션 값으로 지정하는 변수를 생성함
			// 기본적으로 SESSION값은 30분동안 유지됨.			
			log.info("로그인 성공");
			
		}else {
			log.info("로그인 실패");
		}
	} // 로그인창을 통해 입력된 form 데이터 처리를 함.
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 unset
		return "redirect:/";
	}
	
	
}
