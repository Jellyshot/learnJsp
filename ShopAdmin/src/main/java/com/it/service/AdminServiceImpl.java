package com.it.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.AdminVO;
import com.it.mapper.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;

	/* AdminMapper의 read를 테스트했을 시 해당 아이디와 비밀번호가 일치하는 값이 있으면 결과값이 나오고, 
	아니면 안나오는 두가지 경우만 존재하므로, boolean 타입의 로그인 권한 메서드를 생성 */
	
	@Override
	public boolean auth(AdminVO admin) {
		admin = mapper.read(admin);
		if(admin != null) {
			return true;
		}else {
			return false;
		}
	}
	
}


