<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>




<div id="main">
	<section class="post">
		<header class="major">
			<span class="date">${serverTime}</span>
			<h1>${m_id}님의 구매내역</h1>
			<ul class="actions">
				<li><a href="/" class="button primary">상품목록으로</a></li>
			</ul>
		</header>
	
		<!-- 리스팅 시작 -->
		<div class="card-body">
			<div class="table-responsive" style="boder:1px">
				<table class="table table-bordered" width="100%" cellspacing="0">
				<thead>
						<tr>
							<td>상세코드</td>
							<td>상품코드</td>
							<td>상품명</td>
							<td>이미지</td>
							<td>상품가격</td>
							<td>수량</td>
							<td>금액</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="ordersub">
							<tr>
								<td>${ordersub.os_code}</td>
								<td>${ordersub.p_code}</td>
								<td>${ordersub.p_name}</td>
								<td><img alt="정보없음" src="/resources/product/${ordersub.p_code}.jpg" height="100"></td>
				<!-- 가격부분에 formating 실시 -->
								<td><fmt:formatNumber value="${ordersub.p_price}" pattern="###,###"/></td>
								<td>${ordersub.os_cnt}</td>
								<td><fmt:formatNumber value="${ordersub.os_money}" pattern="###,###" /></td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
						<p style="float:right; font-size:1.5rem;">장바구니 총 금액은
						<b><fmt:formatNumber value="${ordertotal.om_total}" pattern="###,###"/>원</b> 입니다.</p>
			</div>
		</div>
	</div>
		
	</section>
</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp"%>