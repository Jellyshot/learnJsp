package com.it.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.Board2VO;
import com.it.service.Board2Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board2/")
public class Board2Controller {
	
	@Setter(onMethod_ = @Autowired)
	private Board2Service service;
	
	// ---------------------- Create -------------------------------
		@GetMapping("/insert")
		public void insert() {
			// form이 들어간 package를 호출만 함.
		}
		
		
		// 앞에 form action에 /board/insert를 지정해 놓았으므로 insert중 하나로 들어오는데, form method가
		// post임으로 form의 input 태그의 name과 Board2VO의 멤버변수 이름에 맞추어 postMapping의 board변수에 저장된다.  
		
		@PostMapping("/insert")
		public void insert(HttpServletRequest request) {
//			HttpServletRequest : request 메서드를 사용할 수 있도록 만들어주는 클래스
			
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
								
						}else { //바이너리 파일이라면 (사진, File형식) 절대경로값을 filefile변수에 저장
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
				log.info(board);
				
			}catch(Exception e){
				System.out.println(e);
			}
		}
}
		