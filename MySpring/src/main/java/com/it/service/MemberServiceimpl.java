package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.MemberVO;
import com.it.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class MemberServiceimpl implements MemberService{
	//쿼리를 사용하기 위한 MemberMapper 객체를 멤버변수로 선언
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	//interface method 재정의
	//member를 넘기게 하여 b_num의 값을 가져옴.
	@Override 
	public MemberVO read(MemberVO member) {
		return mapper.read(member);
	}
	
	//id값을 인증 후 true, 또는 false반환하는 service 쿼리	
	@Override
	public boolean auth(MemberVO member) {
		MemberVO tmp = new MemberVO(); //임시변수 tmp 사용 선언
		tmp = mapper.read(member);
		
		if(tmp != null) { // 1. 넘어온 값이 있을때 아이디가 바른경우
			if(tmp.getM_passwd().equals(member.getM_passwd())) {
/*				내가 놓친부분
 *				1. 문자열은 equals로 비교한다.
 *				2. 스프링에서 객체를 생성할 때는 MemberVO 객체이름 = new MemverVO(); 꼭 해줘야함
 *				3. 비교시에는 덮어쓰기 하지 말것
 **/
				log.info(tmp);
				log.info("로그인 성공");
				return true;
			}else { //2. 넘어온 값이 있을때 비밀번호가 다른 경우
				log.info(tmp);
				log.info("비밀번호를 확인해주세요");
				return false;
			}
		}else{	//3. 아이디가 맞지 않는 경우
			log.info(tmp);
			log.info("아이디를 확인해주세요");
			return false;
		}
	}
		
	@Override
	public void insert(MemberVO member) {
		mapper.insert(member);
	}
	@Override
	public List<MemberVO> getList(){
		return mapper.getList();
	}
	@Override
	public void update(MemberVO member) {
		mapper.update(member);
	}
	@Override
	public void delete(MemberVO member) {
		mapper.delete(member);
	}
}
