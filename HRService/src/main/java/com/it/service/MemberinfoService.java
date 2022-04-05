package com.it.service;

import java.util.List;

import com.it.domain.MemberinfoVO;

public interface MemberinfoService {

	public List<MemberinfoVO> getList();
	
	public MemberinfoVO read(MemberinfoVO memberinfo);
	
	public void insert(MemberinfoVO memberinfo);
	
	public void update(MemberinfoVO memberinfo);

	public void delete(MemberinfoVO memberinfo);
}
