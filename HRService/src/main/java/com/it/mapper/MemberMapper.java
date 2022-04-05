package com.it.mapper;

import java.util.List;

import com.it.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> getList();
	
	public MemberVO read(MemberVO member);
	
	public void insert(MemberVO member);
	
	public void update(MemberVO member);

	public void delete(MemberVO member);
	
	
	public void resetpwd(MemberVO member);
	public void changepwd(MemberVO member);
	
	//Count
	public int gettotalcount();
	public int getmembercount(MemberVO member);
	
}
