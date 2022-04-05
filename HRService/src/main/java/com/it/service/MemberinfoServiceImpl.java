package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.MemberinfoVO;
import com.it.mapper.MemberinfoMapper;

import lombok.Setter;

@Service
public class MemberinfoServiceImpl {
	
	@Setter(onMethod_=@Autowired)
	public MemberinfoMapper mapper;
	
	public List<MemberinfoVO> getList(){
		return mapper.getList();
	}
	public MemberinfoVO read(MemberinfoVO memberinfo) {
		return mapper.read(memberinfo);
	}
	public void insert(MemberinfoVO memberinfo) {
		mapper.insert(memberinfo);
	}
	public void update(MemberinfoVO memberinfo) {
		mapper.update(memberinfo);
	}
	public void delete(MemberinfoVO memberinfo) {
		mapper.delete(memberinfo);
	}

}
