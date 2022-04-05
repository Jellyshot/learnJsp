package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberinfoVO {
	private int i_code;
	private int m_code;
	private String i_value;
	private Date i_sdate;
	private Date i_edate;
}
