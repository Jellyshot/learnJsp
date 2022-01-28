package com.it.service;

import java.util.List;

import com.it.domain.MemberVO;

public interface MemberService {
	//전체 레코드 조회
	public List<MemberVO> getList(); 
	
	//단일 레코드 조회
	public MemberVO read(MemberVO member);
	
	//로그인을 위한 id와 passwd 조회(새로 코드를 만들어 보자)
	public boolean auth (MemberVO member);	
	
	//레코드 입력
	public void insert(MemberVO member);
	
	//레코드 수정
	public void update(MemberVO member);
	
	//레코드 삭제 메서드. 역시 boolean타입을 줌
	public void delete(MemberVO member);
	
//	MemberVO read(MemberVO member);
}
