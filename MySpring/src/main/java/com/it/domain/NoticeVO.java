package com.it.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private int n_num;
	private String n_name;
	private String n_subject;
	private String n_contents;
	private Date n_date;
}
/* @Data는 lombok 에서 가져오는 기능으로, 
	setter, getter, toString, constructor에 대한 기본 정보를 자동으로 생성하는 어노이먼스 이다.*/
