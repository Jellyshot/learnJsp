package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int m_code;
	private String m_pwd;
	private int t_code;
	private String m_name;
	private Date m_joindate;
	private int b_code;
	private int d_code;
	private int p_code;
	private String m_enumber;
	private int s_code;
	private String m_phone;
	private String m_address;
	private String m_email;
	private int e_code;
}
