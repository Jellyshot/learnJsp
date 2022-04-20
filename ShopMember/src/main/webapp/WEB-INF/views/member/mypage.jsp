<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<!-- Post -->
<div id="main">
	<section class="post">
		<header class="major">
			<span class="date">${serverTime}</span>
			<h1>My Page</h1>
			<ul class="actions">
				<li><a href="/shop/cartinfo" class="button primary">장바구니</a></li>
				<li><a href="/member/update" class="button">회원정보수정</a></li>
				<li><a href="/member/delete?m_id=${m_id}"  class="button">회원탈퇴</a></li>
			</ul>
		</header>
		<p>${m_id}님의 최근 구매내역</p>
		<table>
			<tr>
				<td>주문번호</td>
				<td>주문일</td>
				<td>이미지</td>
				<td>제품명</td>
				<td>수량</td>
				<td>단가</td>
				<td>금액</td>
			</tr>
		<c:forEach items="${ordermanage}" var="ordermanage">
			<tr>
				<td>${ordermanage.om_code}</td>
				<td>${ordermanage.om_rdate}</td>
				<td><img src="/resources/product/${ordermanage.p_code}.jpg" height="200px"></td>
				<td>${ordermanage.p_name}</td>
				<td>${ordermanage.os_cnt}</td>
				<td>${ordermanage.p_price}</td>
				<td>${ordermanage.os_price}</td>
			</tr>				
		</c:forEach>	
		</table>
	</section>
</div>
<%@ include file="../include/footer.jsp"%>