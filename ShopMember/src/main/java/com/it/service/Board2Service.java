package com.it.service;

import java.util.List;

import com.it.domain.Board2VO;
import com.it.domain.PageDTO;

public interface Board2Service {
	public Board2VO read(Board2VO board);
	public void insert(Board2VO board);
	public List<Board2VO> getList(PageDTO page);
	public void update(Board2VO board);
	public void delete(Board2VO board);
	public int getTotalCount();
}
