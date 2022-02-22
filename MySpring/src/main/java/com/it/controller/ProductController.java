package com.it.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.domain.ProductVO;
import com.it.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/")
public class ProductController {

	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	@PostMapping("/insert")
	public String insert(ProductVO product) {
//		log.info(product);
		service.insert(product);
		return "redirect:/product/list";
	}
	
	@GetMapping("/view")
	public void view(ProductVO product, Model model) {
//		보여줄것을 담을 가방이 필요하구, read 메서드를 통해 읽어온 값을 저장할 변수와 그 변수를 전달할 addAttribute 함수 필요.
		product = service.read(product);
		model.addAttribute("product", product);
	}
	
//	상품 번호를 받아 이미지를 업로드 시키는 imgupload 함수 작성
	@GetMapping("/imgupload")
	public void imgupload(ProductVO product, Model model) {
		log.info("-----------이미지 업로드할 상품 번호 확인---------------");
		log.info(product);
		model.addAttribute("p_code", product.getP_code());
	}
	
	@PostMapping("/imgupload")
	public void imgupload(HttpServletRequest request) {
//		HttpServletRequest : request 메서드를 사용할 수 있도록 만들어주는 클래스
		DiskFileUpload upload = new DiskFileUpload(); // 데이터 전송 컴포넌트 'upload' 생성
//		DiskFileUpload = java의 내장함수 현업에서는 내장말고 유료서비스 씀.
		try {
			List items = upload.parseRequest(request); // 웹브라우저 전송 객체를 생성하여 upload 컴포넌트에 전달.
			Iterator params = items.iterator(); // Iterator 반복자 생성하여 List형태의 items를 반복시켜 값을 받아냄
//			iterator는 ArrayList, HashSet과 같은 컬렉션을 반복하는 데 사용할 수 있는 객체다
/*			Iterator 는 컬렉션에서 요소를 제어 하는 기능, 
 * 			next()및 previous()를 사용해서 앞뒤로 이동하는 기능, 
 * 			hasNext()를 통해 더 많은 요소가 있는지 확인할 수 있는 기능들이 있다.
			보통 인덱스가 없는 자료구조인 경우 그 데이터의 안을 돌기 위해서 for-each 문과 iterator중 하나를 사용한다. 
			foreach를 사용하지 않는 이유는, Iterator를 쓰면 데이터를 집어넣지 않아도 null값이 있다고 판단하여 반복을 돌리는데
			foreach의 경우 값이 없다면 반복을 시키지 않는다.*/
			String imgpath = "C:\\myWorkspace\\learnJsp\\MySpring\\src\\main\\webapp\\resources\\product";
//			목적이 사진 업로드이므로 경로를 설정해 주고
			String p_code = ""; // while문 전체에서 사용할 p_code 변수를 선언한다.
			
			while(params.hasNext()) { //form 객체가 있을 경우
				FileItem item = (FileItem)params.next(); //폼형식 객체를 변수에 저장
//				위에서 받은 params의 데이터 타입을 FileItem으로 캐스팅하여 item에 저장하고
				if(item.isFormField()) { 
					// FormField라면 (form의 input같은걸 말함) p_code를 가져오고(지금 input에 담긴게 p_code 이니까
						p_code = item.getString();
							
					}else { //바이너리 파일이라면 (사진, File형식) 절대경로값을 imgfile변수에 저장
						File imgfile = new File(imgpath + "/" + p_code + ".jpg");
//							File 생성자는 java.io 패키지 추가해야함.
						item.write(imgfile); //해당 경로에 파일 쓰기
						
					}
			}
		}catch(Exception e){
			System.out.println(e);
		}
		
		
		
// ---------------- 컨트롤러에서 매개변수로 사용가능한 객체(jsp에서는 사용가능하지만 java에서는 선언=]0해주어야 함) ----------		
/*			1. VO - 가방으로 사용
 * 			2. Model model
 * 			3. HttpSession session
 * 			4. HttpServletRequest request
 * 			5. HttpServletResponse response
 */
	}
}
