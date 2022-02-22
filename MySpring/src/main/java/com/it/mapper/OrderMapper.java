package com.it.mapper;

import com.it.domain.OrdermainVO;
import com.it.domain.OrdersubVO;

public interface OrderMapper {
	
	public void insertmain(OrdermainVO ordermain);
	
	public void insertsub(OrdersubVO ordersub);
	
	public OrdermainVO readMainid(OrdermainVO ordermain);

}
