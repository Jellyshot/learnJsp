package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AttendanceVO {
	private int a_code;
	private int m_code;
	private int c_code;
	private Date a_sdate;
	private Date a_edate;
}
