package com.it.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;
import com.it.domain.PageviewDTO;
import com.it.service.NoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/notice/")
public class NoticeController {
	
	@Setter(onMethod_ = @Autowired)
	public NoticeService service;
	
	
	@GetMapping("/list") 
	public void list(Model model, PageDTO page){
		
		model.addAttribute("list", service.getList(page));
		
		int total = service.getTotalCount();
		PageviewDTO pageview = new PageviewDTO(page, total);
		model.addAttribute("pageview", pageview);
	
	}
	
	@GetMapping("/view")
	public void veiw(NoticeVO notice, Model model, PageDTO page) {
			notice = service.read(notice);
			model.addAttribute("notice", notice);
			model.addAttribute("page", page);
	}
	
	@GetMapping("/downLoad")
	public void download(NoticeVO notice, HttpServletResponse response) {

		notice = service.read(notice);
			try {
				String filepath = "c:\\myWorkspace\\learnJsp\\pds\\"+notice.getN_file();
				File file = new File(filepath);
				
				String newName = new String(file.getName().getBytes("UTF-8"),"ISO-8859-1");
				//한글 처리 가능하도록 file name을 byte타입으로 인코딩
				
				response.setHeader("Content-Disposition", "attachment;filename="+newName);
				log.info(file.getName());
				
				FileInputStream fis = new FileInputStream(filepath);
				OutputStream out = response.getOutputStream();
				
				int read = 0;
				byte[] buffer = new byte[1024];
				
				while((read = fis.read(buffer)) != -1) {
					out.write(buffer, 0, read); // buffer의 처음부터 read에 저장된 값만큼 웹 브라우저에 출력
				}
				
			} catch (Exception e) {
				System.out.println(e);
			}
	}
	
}
