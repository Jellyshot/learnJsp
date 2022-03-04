package com.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.BoardVO;
import com.it.domain.PageDTO;
import com.it.domain.PageviewDTO;
import com.it.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* @RequestMapping 어노이먼스는 기본 url에 board를 끼운다는걸 말함. 
 * 앞으로 board이하에 만들거라고 명시하는 어노이먼스?
 * src>main>webapp>WEB-INF>views아래 board폴더 생성
 * requestMapping getMapping postMapping등을 이용하여 url의 경로를 지정해줌
 */
@Controller
@Log4j
@RequestMapping("/board/")
public class BoardController {
//컨트롤러 목적의 클래스
	

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	
	
//	process부분에서는 return: "redirect:"; 를 하고, 나머지에서는 model.Attribute를 사용한다.	
//	process 파일 따로 필요 없이 controller에서 처리한다. jsp파일은 폼 부분만 있으면 됨.
// ---------------------   Read  ------------------------------
	@GetMapping("/list")
	public void list(Model model, PageDTO page) {
		// Model : jsp로 데이터를 전달해주는 Controller 내장 객체. 주로 VO객체를 저장함.
		// RequestParam 변수를 생성하는 어노테이션. "user"는 웹브라우저에서 쓸 이름, String user는 변수이름
		
		// Tomcat 실행.
		// board 폴더로 가서 list.jsp 를 만들어 줌 그럼 이제 list.jsp로 가게됨.
		// model의 속성인 addAttribute를 사용하여 list라는 인스턴스변수에 getList한 데이터를 list.jsp에 전달
		model.addAttribute("list", service.getList(page));
		// list.jsp에서는 item="${list}"로 내용을 받음.
		
		
		// --- 페이지네이션 ---
			int total = service.getTotalCount(); //전체 레코드 갯수
		//pageDTO를 타고 넘어오는 pageNum을 이용하여 정보를 jsp로 넘겨줌
			PageviewDTO pageview = new PageviewDTO(page, total);
			//파라미터로 page, total을 받으니까 list를 통해 넘어온 정보들을 따로 set해주지 않아도 가지고 있음.
			model.addAttribute("pageview", pageview);
			
		// 가방대신 RequestParam로 만든 변수 출력해보기~! url에 ?user=🍰를 하면 콘솔에 🍰가 찍힌다.	
		// public void list	@RequestParam("user") String user, @RequestParam("age") int age) 
		// 다만 이 방식일때는, Null값이 되는 변수, 항상 값이 넘어가지 않는 경우에는 사용하면 안된다. 에러가뜸! 그래서 가방(객체)가 편함! 
		//	log.info("--- board url의 유저를 출력해보아요 ---");
		//	log.info(user);
		//	log.info("--- board url의 나이를 출력해보아요 ---");
		//	log.info(age + 1);
		//	model.addAttribute("user", user);
		//	model.addAttribute("age", age);
	}
	
	
	
// ---------------------- Create -------------------------------
	@GetMapping("/insert")
	public void insert() {
		// form이 들어간 package를 호출만 함.
	}
	
	// 앞에 form action에 /board/insert를 지정해 놓았으므로 insert중 하나로 들어오는데, form method가
	// post임으로 form의 input 태그의 name과 BoardVO의 멤버변수 이름에 맞추어 postMapping의 board변수에 저장된다.  
	@PostMapping("/insert")
	public String insert(BoardVO board) {
		log.info("----------글쓰기 시작----------"); //echo outmsg처럼 log.info를 사용함
		log.info(board);
		service.insert(board);
		log.info("----------글쓰기 완료----------");
	//	입력 완료 후 '컨트롤러를 거쳐서' 페이지 이동시키기 -> redirect:를 url 앞에 써줌		
		return "redirect:/board/list";
	}// form에서 제출 버튼을 누르면 board에 log.info처리된것들이 insert됨

	
	//앞서 list에서 num값을 get방식으로 가져와 view링크로 온 것에 대한 역할을 구현함.(두개 이상넘길때는 & 사용) 
	//역할은 구혔으나, 보여줄 페이지가 없으므로 view.jsp 역시 만들어 줘야 함
	//log.info를 이용하여 list.jsp를 클릭했을 때 b_num이 제대로 넘어가는지 console로그 확인(디버깅)
	
	
//	------------------- 수정, 삭제를 위한 view ---------------------------
	@GetMapping("/view")
	public void view(BoardVO board, Model model, PageDTO page) {
		log.info("-----view num 확인-----");
		log.info(board); //여기서 board에는 list에서 받은 b_num값이 들어 있음.
		board = service.read(board); 
		log.info("-----view num에 따른 read 확인-----");
		log.info(board);
		
	/*	read 로 board변수에 값을 담았으므로, board변수에 있는 값을 name="board"로 넘김.
	 *  값을 넘길때는 model.addAttribute(String, object)를 사용하고, 페이지를 이동시킬때는 redirect:url을 사용.
	 *  addAttribute는 값만 넘겨주고 끝이므로 리턴값이 필요 없지만, redirect:url은 메세지 출력해야 하니까 return값이 있음? 
	 *  그래서 void가 아니라 string을 써줘야함. 맞니?
	 *  model의 속성인 addAttribute를 사용하여 board라는 인스턴스변수에 board객체에 담은 데이터를 전달
	 */
		model.addAttribute("board",board);
		//get으로 받았던 pageNum을 저장하기 위해 PageDTO 파라미터를 인지시켜주고, addAttribute 시켜줌.		
		model.addAttribute("page", page);
	}
	
	
//	------------------------ Update ------------------------------------
//	view에서 넘겨준 b_num값으로 데이터를 update(form)에 불러옴.
	@GetMapping("/update")
	public void update(BoardVO board, Model model, PageDTO page) {
		log.info("-----update num 확인-----");
		log.info(board);
		board = service.read(board);
		log.info("-----update 데이터 확인-----");
		log.info(board);
		model.addAttribute("board", board);
		model.addAttribute("page", page);
	}
	
//	form에서 수정버튼을 누르면 작동하는 코드 작성 (update_process 리턴 필요)
	@PostMapping("/update")
	public String update(BoardVO board, PageDTO page) {
		log.info("---------앞에서 받아온 update할 데이터 확인----------");
		log.info(board);
		service.update(board);
		//문자열 안에서 띄워쓰기는 그대로 반영되기때문에 안되지만, 문자열 외 값을 가져오는 문법에서의 띄워쓰기는 괜찮음.		
		return "redirect:/board/view?b_num=" + board.getB_num() + "&pageNum=" + page.getPageNum();		
	}
	
	
//	------------------------ Delete ------------------------------	
	
	@GetMapping("/delete")
	public String delte(BoardVO board) {
		log.info("-----삭제-----");
		service.delete(board);
		return "redirect:/board/list";
	}
	
}




