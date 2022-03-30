package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.MemberVO;
import com.it.domain.PageDTO;
import com.it.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	public MemberMapper mapper;
	
	@Override
	public List<MemberVO> getList(PageDTO page){
		return mapper.getList(page);
	}
	@Override
	public void insert(MemberVO member) {
		mapper.insert(member);
	}
	@Override
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}
	@Override
	public void update(MemberVO member) {
		mapper.update(member);
	}
	@Override
	public void delete(MemberVO member) {
		mapper.delete(member);
	}
	@Override
	public boolean login(MemberVO member) {
		member = mapper.login(member);
		if(member!=null) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public void upasswd(MemberVO member) {
		mapper.upasswd(member);
	}
	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
}
