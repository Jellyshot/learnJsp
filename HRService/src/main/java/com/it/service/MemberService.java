package com.it.service;

import java.util.List;

import com.it.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getList();
	
	public MemberVO read(MemberVO member);
	
	public void insert(MemberVO member);
	
	public void update(MemberVO member);

	public void delete(MemberVO member);
	
	public void resetpwd(MemberVO member);
	
	public void changepwd(MemberVO member);
	
	public int gettotalcount();
	public int getmembercount(MemberVO member);

}
