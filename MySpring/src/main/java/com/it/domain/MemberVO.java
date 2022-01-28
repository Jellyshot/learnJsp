package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data //MemberVO의 get, set을 생성
public class MemberVO {

	private String m_id;
	private String m_name;
	private String m_passwd;
	private Date m_rdate;
	private Date m_udate;
}
