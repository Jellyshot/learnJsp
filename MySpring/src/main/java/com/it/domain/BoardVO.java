package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int b_num;
	private String b_subject;
	private String b_name;
	private String b_contents;
	private Date b_date;
	//Date type을 사용할 때는 java의 util pakage의 import구문이 필요하다.
}
