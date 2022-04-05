<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


<!-- Main -->
	<div id="main">

		<!-- Post -->
			<section class="post">
				<header class="major">
					<span class="date">${serverTime}</span>
					<h1>${m_id}님의 장바구니</h1>
				</header>
				<table>
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
					<c:forEach items="${list}" var="cartsub">
							<tr>
								<td>${cartsub.cs_code}</td>
								<td>${cartsub.p_code}</td>
								<td>${cartsub.p_name}</td>
								<td><img alt="정보없음" src="/resources/product/${cartsub.p_code}.jpg" height="100"></td>
				<!-- 작성일 부분은 길어지기 때문에 formating 실시 -->
								<td><fmt:formatNumber value="${cartsub.p_price}" pattern="###,###"/></td>
								<td>
				<!-- SELECT 태그를 이용하여 수량 변경할 수 있도록 하기(*알아두기:JSP의 if문에는 else가 없음.고려할것)
					1. 내가 장바구니에 담아둔 갯수가 option에 기본으로 설정되어 있도록 해줌. 
					2. 변경한 숫자를 전송할 수 있도록 해줌.-->
								<form action="/shop/cartupdate" method="post" style="float:left;">
									<input type="hidden" name="cs_code" value="${cartsub.cs_code}">
									<select name="cs_cnt">
										<c:forEach var="count" begin="1" end="30" step="1"> // var= 변수를 나타냄
											<c:if test="${count == cartsub.cs_cnt}">	// jsp if문의 text는 조건식을 적는 란이다.
											<option value="${count}" selected>${count}</option>
											</c:if>
											<c:if test="${count != cartsub.cs_cnt}">
											<option value="${count}">${count}</option>
											</c:if>
										</c:forEach>
									</select>
									<div class="actions small">
									<input type="submit" value="변경" class="button small">
									<a href="/shop/cartdelete?cs_code=${cartsub.cs_code}&cm_code=${cm_code}" class="button small">&nbsp;삭제</a>
									</div>
								</form>
								</td>
								
								<td><fmt:formatNumber value="${cartsub.cs_money}" pattern="###,###" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<h2 style="float:right;">장바구니 총 금액은
						<b><fmt:formatNumber value="${carttotal.cm_total}" pattern="###,###"/>원</b> 입니다.</h2>
						
						<!-- cm_code가 있으면(장바구니에 무언가 담겨있으면),전체삭제를 해주는 버튼 생성  -->
				<div class="actions">
					<c:if test="${not empty cm_code}">
						<a href="/shop/cartdeleteall?cm_code=${cm_code}" class="button">전체삭제</a>
						<a href="/shop/address?cm_code=${cm_code}" class="button">배송지 입력</a>
					<%-- <a href="/shop/orderinfo?cm_code=${cm_code}" class="button">주문하기</a> --%>
					</c:if> 
				</div>
			</section>
</div>

				
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp"%>