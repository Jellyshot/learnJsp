package com.it.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String list(Model model, PageDTO page, HttpSession session){
		String a_id = (String)session.getAttribute("a_id");
		if(a_id == null) {
			return "redirect:/admin/login";
			
		}else {
		model.addAttribute("list", service.getList(page));
		
		int total = service.getTotalCount();
		PageviewDTO pageview = new PageviewDTO(page, total);
		model.addAttribute("pageview", pageview);
		}return "/notice/list";
	}
	
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	@PostMapping("/insert")
	public String list(HttpServletRequest request) {
		DiskFileUpload upload = new DiskFileUpload();
		
		try {
			List list = upload.parseRequest(request);
			Iterator params = list.iterator();
			/*Iterator - ArrayList, HashSet을 반복하는데 사용할 수 있는 객체로
			 * next(), previous()로 이동 hashNext()다음요소 확인 기능이 있음
			 */
			
			String filepath = "C:\\myWorkspace\\learnJsp\\pds";
			
			NoticeVO notice = new NoticeVO();
			
			while(params.hasNext()) {
				FileItem item = (FileItem)params.next();
				if(item.isFormField()) {
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString("utf-8");
					//itme의 input type에 저장된 값을 한글사용가능하도록 인코딩하여 String타입으로 fieldvaule 객체에 저장
					log.info(fieldname + ":" + fieldvalue);
					
					if(fieldname.equals("n_subject")) {
						notice.setN_subject(fieldvalue);
					}else if(fieldname.equals("n_name")) {
						notice.setN_name(fieldvalue);
					}else if(fieldname.equals("n_contents")) {
						notice.setN_contents(fieldvalue);
					}
				}else {
					//item의 next()가 form형태가 아닌 바이너리 파일이라면 절대경로값 지정
					String fname = item.getName();
					log.info(fname);
					if(fname!="") {
						notice.setN_file(fname);
						File file = new File(filepath + "/" + fname);
						log.info(file.getName());
						item.write(file);
					}
				}
			} // - end of while
			log.info("insert Notice"+request);
			service.insert(notice);
		}catch(Exception e) {
			System.out.println(e);
		}
		return "redirect:/notice/list";
	} // -end of Post insert
	
	
	
	@GetMapping("/view")
	public void veiw(NoticeVO notice, Model model, PageDTO page) {
		notice = service.read(notice);
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
	}
	
	@GetMapping("/downLoad")
	public void downLoad(NoticeVO notice, HttpServletResponse response) {
		notice = service.read(notice);
		
		try {
			String filepath = "c:\\myWorksapce\\learnJsp\\pds\\"+notice.getN_file();
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
				out.write(buffer, 0, read);
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	
	@GetMapping("/update")
	public void update(NoticeVO notice, Model model, PageDTO page) {
		notice = service.read(notice);
		log.info("update Notice"+notice);
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
	}
	
	@PostMapping("/update")
	public String update(HttpServletRequest request, PageDTO page) {
		DiskFileUpload upload = new DiskFileUpload();
		NoticeVO notice = new NoticeVO();
		try {
			List items = upload.parseRequest(request);
			Iterator params = items.iterator();
			
			String filepath = "C:\\myWorkspace\\learnJSP\\pds";
			
			
			while(params.hasNext()) {
				FileItem item = (FileItem)params.next();
				if(item.isFormField()) {
					String fieldname = item.getFieldName();
					String fieldvalue = item.getString("utf-8");
					log.info(fieldname + ":" + fieldvalue );
					
					if(fieldname.equals("n_subject")) {
						notice.setN_subject(fieldvalue);
					} else if(fieldname.equals("n_name")) {
						notice.setN_name(fieldvalue);
					} else if(fieldname.equals("n_contents")) {
						notice.setN_contents(fieldvalue);
					} else if(fieldname.equals("n_num")) {
						notice.setN_num(Integer.parseInt(fieldvalue));
					} else if(fieldname.equals("n_fileold")) {
						notice.setN_file(fieldvalue);
					}
				} else {
					String fname = item.getName();
					log.info("바이너리 파일이름 : " + fname);
					if (fname != null) {
						File file = new File(filepath + "/" + fname);
						notice.setN_file(fname);
						item.write(file);
					}
				}
			} // - end of while
			//log.info(notice);
			service.update(notice);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return "redirect:/notice/view?n_num=" + notice.getN_num() + "&pageNum=" + page.getPageNum();
	}
//	public String update(NoticeVO notice, PageDTO page) {
//		log.info(notice);
//		service.update(notice);
//		return "redirect:/notice/view?n_num=" + notice.getN_num() + "&pageNum=" + page.getPageNum();
//	}
	
	
	@GetMapping("/delete")
	public String delete(NoticeVO notice) {
		service.delete(notice);
		return "redirect:/notice/list";
	}
	
}
