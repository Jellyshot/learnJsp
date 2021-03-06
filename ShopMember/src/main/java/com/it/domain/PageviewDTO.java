package com.it.domain;

import lombok.Data;

@Data
public class PageviewDTO {
//	페이지네이션의 시작과 끝을 정의하는 클래스
	
	//시작지점과 종료지점 설정	
	private int startPage;
	private int endPage;
	private int realend;
	
	//전, 후 페이지가 존재하면 보여줄 버튼	
	private boolean prev;
	private boolean next;
	
	//총 페이지수 	
	private int total;
	
	//PageDTO의 정보들을 객체 형태로 받아냄(pageNum와 amount가 저장되어 있음) list에서 게시글 상세보기 할때, 돌아올때를 위하여 현재 페이지를 같이 넘겨줄꼬임
	PageDTO page;
	
	//PageViewDTO 생성자	
	public PageviewDTO(PageDTO page, int total) {
		//계산을 위해 멤버변수로 넘어온것과 전체 레코드 갯수를 전달하기 위한 생성자
		this.page = page;
		this.total = total;
		
		this.endPage = (int)Math.ceil((double)page.getPageNum()/10.0) * 10; 
		//현재페이지/limit(인데, 여기서는 pageAmount를 페이지네이션 길이겸 레코드 갯수로 씀. 어차피 똑같으니까 변수 따로 안주었음) 
		/*pageNum = 현재 페이지(페이지네이션)
			pagenation length = 10
			
			페이지네이션의 1~10, 11~20까지를 하나의 그룹으로 묶기 위해, 페이지네이션의 길이인 10으로 나누었을 때, 
			1/10~10/10이 동일한 값이 되도록하기 위하여 올림처리를 하여 해당값들이 1이 되도록 함(ceil)
			
			결과값을 소숫점으로 받기위해 위해 4바이트 정수를 8바이트로 변경되도록 10이 아닌, 10.0으로 기재해준다.
		 	*/
		
		this.startPage = this.endPage - 10 + 1;
		
		// 실제 페이지네이션(페이지 번호) 끝
		this.realend = (int)Math.ceil(total/(double)page.getPageAmount());
		if (this.realend < this.endPage) {
			this.endPage = realend;
		}
		
		this.next = this.endPage < this.realend; // 최소 시작페이지가 11일경우 참
		this.prev = this.startPage > 1;
		
		
	}
}
