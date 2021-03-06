package com.it.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.domain.NoticeVO;
import com.it.domain.PageDTO;
import com.it.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoticeServiceImpl implements NoticeService {
	
	
	@Setter(onMethod_ = @Autowired)
	public NoticeMapper mapper;

	public List<NoticeVO> getList(PageDTO page){
		return mapper.getList(page);
	}
	
	public void insert(NoticeVO notice) {
		mapper.insert(notice);
	}
	public NoticeVO read(NoticeVO notice) {
		return mapper.read(notice);
	}
	public void update(NoticeVO notice) {
		mapper.update(notice);
	}
	public void delete(NoticeVO notice) {
		mapper.delete(notice);
	}
	
	public int getTotalCount() {
		return mapper.getTotalCount();
	}
}
