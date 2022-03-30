package com.it.mapper;

import java.util.List;

import com.it.domain.MemberVO;
import com.it.domain.PageDTO;

public interface MemberMapper {
	
	public List<MemberVO> getList(PageDTO page);
	public void insert(MemberVO member);
	public MemberVO read(MemberVO member);
	public void update(MemberVO member);
	public void delete(MemberVO member);
	
	
	public void upasswd(MemberVO member);
	
	public int getTotalCount();
	

}
