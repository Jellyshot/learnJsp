package com.it.mapper;

import java.util.List;

import com.it.domain.OrderdetailDTO;
import com.it.domain.OrdermainVO;
import com.it.domain.OrdermanageDTO;
import com.it.domain.OrdermemberDTO;
import com.it.domain.OrdersubVO;
import com.it.domain.PageDTO;

public interface OrderMapper {
	
	// 장바구니에 담긴  내용을 주문으로 넣기	
	public void insertmain(OrdermainVO ordermain);
	public void insertsub(OrdersubVO ordersub);

	// m_id로 ordermain내용 불러오기
	public OrdermainVO readMainid(OrdermainVO ordermain);
	
	//ordermain의 내용 불러오기
	public List<OrderdetailDTO> getListOrderDetail(OrdermainVO ordermain);

	public OrdermemberDTO getOrderTotal(OrdermainVO ordermain);
	
	public List<OrdermanageDTO> ordermanage(PageDTO page);

	public void statusupdate(OrdermanageDTO ordermanage);
	
	public int getTotalCount();
}
