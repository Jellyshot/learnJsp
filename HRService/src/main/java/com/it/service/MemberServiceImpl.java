package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.MemberVO;
import com.it.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	public List<MemberVO> getList(){
		return mapper.getList();
	}
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}
	public void insert(MemberVO member) {
		mapper.insert(member);
	}
	public void update(MemberVO member) {
		mapper.update(member);
	}
	public void delete(MemberVO member) {
		mapper.delete(member);
	}
	
	public void resetpwd(MemberVO member) {
		mapper.resetpwd(member);
	}
	
	public void changepwd(MemberVO member) {
		mapper.changepwd(member);
	}
	public int gettotalcount() {
		return mapper.gettotalcount();
	}
	public int getmembercount(MemberVO member) {
		return mapper.getmembercount(member);
	}
}
