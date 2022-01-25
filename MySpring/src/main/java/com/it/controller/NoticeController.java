package com.it.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.NoticeVO;
import com.it.service.NoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


// requestMapping getMapping postMapping등을 이용하여 url의 경로를 지정해줌
@Controller
@Log4j
@RequestMapping("/notice/")
public class NoticeController {
// 컨트롤러 목적의 클래스
// 컨트롤러는 서비스와 뷰 사이의 중개자 역활을 함
	
	
//---- 해당 클래스에서 Service 메서드를 사용할 것이므로 임시객체 service생성 ----
	@Setter(onMethod_=@Autowired)
	private NoticeService service;
	

//	사용자가 url에 /list를 입력하면 service 인터페이스에서 선언한 getList로 데이터를 불러와 list변수에 담아 Controller의 내장 객체인 model의 Attribute 전달속성을 사용.
//	이렇게 전달한 데이터는 list.jsp에서 item="${list}"로 받음.
//	Model: jsp로 데이터를 전달해 주는 내장객체로 주로 VO객체를 저장함.

	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}

// ---------- Create ----------
	@GetMapping("/insert")
	public void insert() {
	//get방식으로 insert를 받을 경우 패키지를 호출만 함	
	}
	
	@PostMapping("/insert")
	public void insert(NoticeVO notice) {
		log.info("------ insert 내용 ------");
		log.info(notice);
		service.insert(notice);
		log.info("------ insert 완료 -------");
	}
//	--------
}
