package com.it.mapper;

import com.it.domain.MemberVO;

public interface MemberMapper {
	

	public void insert(MemberVO member);
	public MemberVO read(MemberVO member);
	
	public void update(MemberVO member);

	public void delete(MemberVO member);

	public MemberVO login(MemberVO member);
	public void upasswd(MemberVO member);
	
	public int getTotalCount();
	

}
