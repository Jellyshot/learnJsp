package com.it.service;

import java.util.List;

import com.it.domain.CartmainVO;
import com.it.domain.OrderdetailDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermanageDTO;
import com.it.domain.OrdermemberDTO;

public interface OrderService {

	public OrdermainVO orderproce(CartmainVO cartmain);
	
	public List<OrderdetailDTO> getListOrderDetail(OrdermainVO ordermain);
	
	public OrdermainVO readMainid(OrdermainVO ordermain);
	
	public List<OrdermainVO> readcmcode(OrdermainVO ordermain);
	
	public OrdermemberDTO getOrderTotal(OrdermainVO ordermain);
	
	public List<OrdermanageDTO> ordermanage(OrdermainVO ordermain);
	
	public void deleteid(OrdermainVO ordermain);
}
