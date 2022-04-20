package com.it.mapper;

import java.util.List;

import com.it.domain.OrderdetailDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermanageDTO;
import com.it.domain.OrdermemberDTO;
import com.it.domain.OrdersubVO;

public interface OrderMapper {
	
	public void insertmain(OrdermainVO ordermain);
	
	public void insertsub(OrdersubVO ordersub);
	
	public OrdermainVO readMainid(OrdermainVO ordermain);
	
	public List<OrdermainVO> readcmcode(OrdermainVO ordermain);
		
	public List<OrderdetailDTO>getListOrderDetail(OrdermainVO ordermain);
	
	public OrdermemberDTO getOrderTotal(OrdermainVO ordermain);

	public List<OrdermanageDTO> ordermanage(OrdermainVO ordermain);
	
	public void deletesuball(OrdermainVO ordermain);
	
	public void deletemainall(OrdermainVO ordermain);
}
