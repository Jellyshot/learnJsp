package com.it.mapper;

import java.util.List;

import com.it.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> getList();
//	MemberVO만 들어갈 수 있는 List생성
//	멤버변수칸을 비워두었기 때문에 데이터를 불러올때 #로불러올 수 없음. 
	
	public void insert(MemberVO member);
//	반환값이 없지만 데이터를 담을 가방이 필요한 insert
	
	public MemberVO read(MemberVO member);
//	read는 우리한테 값을 리턴해줘야 함으로 void 대신 MemberVO클래스를 반환타입으로 지정함.
	
//	public MemberVO auth(MemberVO member);
//	로그인 인증시 사용할 쿼리
	
	public void update(MemberVO member);
	
	public void delete(MemberVO member);
}
