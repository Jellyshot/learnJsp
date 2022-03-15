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

@Log4j
@Controller
@RequestMapping("/product/")
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@GetMapping("/list")
	public void list(Model model){
		// 폼만 보여줄 것이 아니라 getList한 내용을 jsp 표기해야 하므로, model에 레코드를 담아 전달
		model.addAttribute("list",service.getList());
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	@PostMapping("/insert")
	public String insert(ProductVO product) {
		log.info(product);
		service.insert(product);
		// insert 완료 후 보여줄 화면은 list
		return "redirect:/product/list";
	}
	
	@GetMapping("/view")
	public void read(ProductVO product, Model model) {
		//read한 값을 view.jsp에 뿌려줘야 하므로 addAttribute 필요
		product = service.read(product);
		model.addAttribute("product", product);
		//📌📌📌 view에 왜 return값이 필요 없는걸까? 📌📌📌		
	}
	
	//insert시 이미지를 함께 업로드 하는것이 아닌 view페이지에서 상품 사진만 따로 올리도록 설정
	@GetMapping("/imgupload")
	public void imgupload(ProductVO product, Model model) {
		log.info("업로드할 상품코드: " + product.getP_code());
		model.addAttribute("p_code", product.getP_code());
	}
	@PostMapping("/imgupload")
	public void imgupload(HttpServletRequest request) {
		DiskFileUpload upload = new DiskFileUpload(); 
//		DiskFileUpload = java의 데이터 전송 컴포넌트
		try {
			List items = upload.parseRequest(request); // 웹브라우저 전송 객체를 생성하여 upload 컴포넌트에 전달.
			Iterator params = items.iterator(); // Iterator 반복자 생성하여 List형태의 items를 반복시켜 값을 받아냄
//			iterator는 ArrayList, HashSet과 같은 컬렉션을 반복하는 데 사용할 수 있는 객체다
			
/*			Iterator의 기능으로는 컬렉션에서 요소를 제어 하는 기능, 
 * 			next()및 previous()를 사용해서 앞뒤로 이동하는 기능, 
 * 			hasNext()를 통해 더 많은 요소가 있는지 확인할 수 있는 기능들이 있다.
			보통 인덱스가 없는 자료구조인 경우 그 데이터의 안을 돌기 위해서 for-each 문과 iterator중 하나를 사용한다. 
			foreach를 사용하지 않는 이유는, Iterator를 쓰면 데이터를 집어넣지 않아도 null값이 있다고 판단하여 반복을 돌리는데
			foreach의 경우 값이 없다면 반복을 시키지 않는다.*/
			String imgpath = "C:\\myWorkspace\\learnJsp\\ShopAdmin\\src\\main\\webapp\\resources\\product";
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
	} // - end of imgupload(post)
	
	@GetMapping("/update")
	public void update(ProductVO product) {
		log.info("수정할 제품정보 : " + product);
	}
	//📌📌📌 와.. 우리 기존에 상품 정보 수정 안함..? 📌📌📌
}
