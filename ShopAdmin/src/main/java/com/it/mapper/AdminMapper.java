package com.it.mapper;

import com.it.domain.AdminVO;

public interface AdminMapper {

	
//	read는 우리한테 값을 리턴해줘야 함으로 void 대신 AdminVO클래스를 반환타입으로 지정함.
	public AdminVO read(AdminVO admin);

}