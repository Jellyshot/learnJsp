package com.it.service;

import java.util.List;

import com.it.domain.MemberVO;
import com.it.domain.PageDTO;

public interface MemberService {

	public List<MemberVO> getList(PageDTO page);
	public void insert(MemberVO member);
	public MemberVO read(MemberVO member);
	public void update(MemberVO member);
	public void delete(MemberVO member);
	
	public boolean login(MemberVO member);
	public void upasswd(MemberVO member);
	
	public int getTotalCount();
	
}
