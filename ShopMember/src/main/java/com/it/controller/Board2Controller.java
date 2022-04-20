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

import com.it.domain.Board2VO;
import com.it.domain.PageDTO;
import com.it.domain.PageviewDTO;
import com.it.service.Board2Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board2/")
public class Board2Controller {
	
	@Setter(onMethod_ = @Autowired)
	private Board2Service service;
	

	
	// ---------------------- Read -------------------------------
	@GetMapping("/list")
	public void list(Model model, PageDTO page, HttpSession session) {
		
		model.addAttribute("list", service.getList(page));
		
		// --- 페이지네이션 ---
			int total = service.getTotalCount(); //전체 레코드 갯수
		//pageDTO를 타고 넘어오는 pageNum을 이용하여 정보를 jsp로 넘겨줌
			PageviewDTO pageview = new PageviewDTO(page, total);
			//파라미터로 page, total을 받으니까 list를 통해 넘어온 정보들을 따로 set해주지 않아도 가지고 있음.
			model.addAttribute("pageview", pageview);
		
	}
	
	//	------------------- 수정, 삭제를 위한 view ---------------------------
	@GetMapping("/view")
	public void view(Board2VO board, Model model, PageDTO page, HttpSession session) {
		
		board = service.read(board); 
		log.info(board);
		model.addAttribute("board",board);
		
		//get으로 받았던 pageNum을 저장하기 위해 PageDTO 파라미터를 인지시켜주고, addAttribute 시켜줌.		
		model.addAttribute("page", page);
	}
	
	
	// ---------------------- Create -------------------------------
		@GetMapping("/insert")
		public String insert(HttpSession session) {
			// form이 들어간 package를 호출만 함.
			String m_id = (String)session.getAttribute("m_id");
			if(m_id == null) {
				return "redirect:/member/login";
				
			}else {
				return "/board2/insert";
			}
		}
		
		
		// 앞에 form action에 /board/insert를 지정해 놓았으므로 insert중 하나로 들어오는데, form method가
		// post임으로 form의 input 태그의 name과 Board2VO의 멤버변수 이름에 맞추어 postMapping의 board변수에 저장된다.  
		
		@PostMapping("/insert")
		public String insert(HttpServletRequest request, HttpSession session) {
//			HttpServletRequest : request 메서드를 사용할 수 있도록 만들어주는 클래스. 클라이언트의 요청으로부터 받은 정보가 VO파일로 받을 수 없는 유형일때 request로 받는다.
			String m_id = (String)session.getAttribute("m_id");
			if(m_id == null) {
				return "redirect:/member/login";
				
			}else {
			DiskFileUpload upload = new DiskFileUpload(); // 데이터 전송 컴포넌트 'upload' 생성
//			DiskFileUpload = java의 내장함수 현업에서는 내장말고 유료서비스 씀.
			try {
				List items = upload.parseRequest(request); // 웹브라우저 전송 객체를 생성하여 upload 컴포넌트에 전달.
				Iterator params = items.iterator(); // Iterator 반복자 생성하여 List형태의 items를 반복시켜 값을 받아냄
//				iterator는 ArrayList, HashSet과 같은 컬렉션을 반복하는 데 사용할 수 있는 객체다
	/*			Iterator 는 컬렉션에서 요소를 제어 하는 기능, 
	 * 			next()및 previous()를 사용해서 앞뒤로 이동하는 기능, 
	 * 			hasNext()를 통해 더 많은 요소가 있는지 확인할 수 있는 기능들이 있다.
				보통 인덱스가 없는 자료구조인 경우 그 데이터의 안을 돌기 위해서 for-each 문과 iterator중 하나를 사용한다. 
				foreach를 사용하지 않는 이유는, Iterator를 쓰면 데이터를 집어넣지 않아도 null값이 있다고 판단하여 반복을 돌리는데
				foreach의 경우 값이 없다면 반복을 시키지 않는다.*/
				
				String filepath = "C:\\myWorkspace\\learnJsp\\pds";
				
				//반복문이 돌기 전에 반복문을 통해 나온 결과값을 저장 할 VO객체를 생성. 
				Board2VO board = new Board2VO();
				
//				목적이 사진 업로드이므로 경로를 설정해 주고
//				String p_code = ""; // while문 전체에서 사용할 p_code 변수를 선언한다.
				while(params.hasNext()) { //form 객체가 있을 경우
					FileItem item = (FileItem)params.next(); //폼형식 객체를 변수에 저장
//					위에서 받은 params의 데이터 타입을 FileItem으로 캐스팅하여 item에 저장하고
					if(item.isFormField()) { 
						// FormField라면 (form의 input같은걸 말함) p_code를 가져오고(지금 input에 담긴게 p_code 이니까
						String fieldname = item.getFieldName();
						String fieldvalue = item.getString("utf-8"); // 이게 있어야 한글을 쓸 수 있음.
//						log.info(fieldname + ":" + fieldvalue);
						
						//위에서 만든 객체에 각 값들을 저장함.
						if(fieldname.equals("b_subject")) {
							board.setB_subject(fieldvalue);
						}else if(fieldname.equals("b_name")) {
							board.setB_name(fieldvalue);
						}else if(fieldname.equals("b_contents")) {
							board.setB_contents(fieldvalue);
						}
								
					} else { //바이너리 파일이라면 (사진, File형식) 절대경로값을 filefile변수에 저장
							String fname = item.getName();
//							log.info(fname);
							if(fname != "") {
								board.setB_file(fname);
								File file = new File(filepath + "/" + fname); //파일 객체 생성
//								File 생성자는 java.io 패키지 추가해야함.
								item.write(file); //해당 경로에 파일 쓰기
							}
					} // - end of else
				} //- end of while
				// 반복구문을 통해 board에 저장한 값을 insert 시킨후 리스트로 이동시킴
				log.info(board);
				service.insert(board);
				
				
			}catch(Exception e){
				System.out.println(e);
			}
			return "redirect:/board2/list";
			}
		} // - end of 'Post' insert
		
		
		
		/* ---------------------- Download -------------------------------
			board2 list에서 첨부파일을 클릭했을 때, 해당 파일을 다운로드 받을 수 있도록 함. */
		
		@GetMapping("/downLoad")
		public void download(Board2VO board, HttpServletResponse response) {

		//response는 jsp파일이 아닌 다른 정보를 클라이언트쪽에 넘겨주어야 할때 씀.
			board = service.read(board);
			
			try {
				//파일을 저장소에서 찾아서
				String filepath = "c:\\myWorkspace\\learnJsp\\pds\\"+board.getB_file();
				File file = new File(filepath);
								
				//한글처리 가능하도록 만들기
				String newName = new String(file.getName().getBytes("UTF-8"),"ISO-8859-1");
				
				/* downLoad는 웹페이지를 여는것이 아닌(text/html이 아니라), 
				파일 객체를 클라이언트에 전송하는것이라는것을 알리는 코드 */
				response.setHeader("Content-Disposition", "attachment;filename="+newName);
				log.info(file.getName());
				
				FileInputStream fis = new FileInputStream(filepath);
				
				//response객체의 기능인 outputstream사용하여 사용자에게 첨부된 파일을 전송할 통로 만들기
				OutputStream out = response.getOutputStream();
				
				/* 버퍼: 파일 운송을 위해 크기의 단위를 1024바이트로 읽은 양을 저장시킬거임. 
					일단 default값은 읽지 않았다는 전체 하에 read에 0을 저장시킴
					만약에 버퍼가 읽지 못한다면 -1 값을 반환하므로, -1이 아니라면 이라는 조건을 줌.	*/
				int read = 0; 
				byte[] buffer = new byte[1024]; 
				while((read = fis.read(buffer)) != -1) {
					out.write(buffer, 0, read); // buffer의 처음부터 read에 저장된 값만큼 웹 브라우저에 출력
				}
			} catch (Exception e) {
				System.out.println(e);
			}

		}
		
		//	------------------------ Update ------------------------------------
		//view에서 넘겨준 b_num값으로 데이터를 update(form)에 불러옴.
		@GetMapping("/update")
		public String update(Board2VO board, Model model, PageDTO page, HttpSession session) {
			String m_id = (String)session.getAttribute("m_id");
			if(m_id == null) {
				return "redirect:/member/login";
				
			}else {
			log.info("-----update할 board정보 확인-----");
			board = service.read(board);
			log.info(board);
			
			model.addAttribute("board", board);
			model.addAttribute("page", page);
			} return "board2/update";
		}
		
		//form에서 수정버튼을 누르면 작동하는 코드 작성 (update_process 리턴 필요)
		@PostMapping("/update")
		public String update(HttpServletRequest request, PageDTO page, HttpSession session) {
			Board2VO board = new Board2VO();
			String m_id = (String)session.getAttribute("m_id");
			if(m_id == null) {
				return "redirect:/member/login";
				
			}else {
			//enctype="multipart/form-data" 형식일때는 일반가방으로 받지 못하므로, 파일업로드 메서드를 써주어야 함.
			DiskFileUpload upload = new DiskFileUpload();
			//board가방을 만들어주고
			
			try {
				//List형식의 변수를 만들어 request로 받아오는 정보들을 upload 시켜준다.
				List items = upload.parseRequest(request);
				//items에 list형식으로 담긴 정보들을 반복자를 사용하여 params에 저장
				Iterator params = items.iterator();
				
				//자료 저장소 생성
				String filepath = "C:\\myWorkspace\\learnJSP\\pds";
				
				while(params.hasNext()) {
					//params에 담긴 것들을 다음 파일이 없을때까지 FileItem형식으로 item 변수에 저장 
					FileItem item = (FileItem)params.next();
					
					//만약 item에 담긴게 폼 형태라면, 이름과 밸류를 가져오고
					if(item.isFormField()) {
						String fieldname = item.getFieldName();
						String fieldvalue = item.getString("utf-8");
						log.info(fieldname+" : "+fieldvalue);
						
						if(fieldname.equals("b_num")) {
							board.setB_num(Integer.parseInt(fieldvalue));
						}else if (fieldname.equals("b_subject")) {
							board.setB_subject(fieldvalue);
						}else if (fieldname.equals("b_contents")) {
							board.setB_contents(fieldvalue);
						}else if(fieldname.equals("b_name")) {
							board.setB_name(fieldvalue);
						}else if(fieldname.equals("b_fileold")) {
							board.setB_file(fieldvalue);
						}
					} else {
						String fname = item.getName();
						log.info("바이너리 파일이름 : " + fname);
						if (fname != "") {
							File file = new File(filepath + "/" + fname);
							board.setB_file(fname);
							item.write(file);
						}
					}
				} // end of while
					service.update(board);
					
			}catch(Exception e) {
				System.out.println(e);
			}
			service.update(board);
			}
			return "redirect:/board2/view?b_num="+board.getB_num() + "&pageNum=" + page.getPageNum();		
		}
		
		@GetMapping("/delete")
		public String delete(Board2VO board, HttpSession session) {
			String m_id = (String)session.getAttribute("m_id");
			if(m_id == null) {
				return "redirect:/member/login";
			} else {
				log.info("삭제할 게시글"+board);
				service.delete(board);
			
			} 	return "redirect:/board2/list";
		}
}
		