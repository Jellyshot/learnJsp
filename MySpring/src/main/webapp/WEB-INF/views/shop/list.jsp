<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>
<div class="container-fluid">
<h1 style="text-align:center">우당탕탕 스토어</h1>
<h3>전체상품보기</h3>
	<p class="mb-4"></p>

	<!-- Page Section -->
	<div class="card shadow mb-4">
	
		<!-- 상품등록 버튼 -->
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/product/insert">상품등록</a>
			</h6>
		</div>
		<!-- 리스팅 시작 -->
		<div class="card-body">
			<div class="table-responsive" style="boder:1px">
				<table class="table table-bordered" width="100%" cellspacing="0">
	<!--  ----- product Read 부분. forEach구문으로 하나씩 뽑아낸 레코드를 product에 하나씩 덮어쓰기함
				해당 쿼리는 JSPL 문으로, 필수 속성값으로 item(List, Map, Array), var(사용할 변수명)을 가진다. 
				반복문 사용후 닫아줘야함----- -->
					<tbody>
						<!-- JSTL 반복문 사용 -->
						<c:set var="cnt" value="0" /> <!-- 변수선언 -->
						<c:forEach items ="${list}" var="product" >
						<!-- Controller에서 넘어온 넘어온 list배열로부터 product변수에 각각 저장하고 
							 forEach 반복구문으로 뽑아온다 -->
							
							<c:choose>
							<c:when test="${cnt % 3 == 0}">
							<tr>
								<td align="center" style="width:33.333%">
								<table>
								<tr style="width:100%"><td align="center">상품번호 :${product.p_code}</td></tr>
								<tr><td align="center">
			<img alt="정보없음" src="/resources/product/${product.p_code}.jpg" height="200" width="200"></td></tr>
								<tr><td align="center">상품명 : ${product.p_name}</td></tr>
								<tr><td align="center">상품가격 : ${product.p_price}</td></tr>
									<tr><td align="center">
									
								<form action="/shop/cart" method="post">
									<input type="hidden" name="p_code" value="${product.p_code}">
									
					<!-- foreach 구문(var="변수명" begin="시작" end="끝" step="단계") 을 사용하여 갯수 선택창 만들기 -->
									<select name="cs_cnt">
										<c:forEach var="count" begin="1" end="30" step="1">
											<option value="${count}">${count}개</option>										
										</c:forEach>
									</select>
									
									<input type="submit" value="장바구니">
									</form>
								</td></tr>
								</table>
								</td> <!-- 3으로 나눈 나머지가 0인그룹 -->
							</c:when>
							
							<c:when test="${cnt % 3 == 2}">	
								<td align="center" style="width:33.333%">
								<table>
								<tr><td align="center">상품번호 :${product.p_code}</td></tr>
								<tr><td align="center"><img alt="정보없음" src="/resources/product/${product.p_code}.jpg" height="200"></td></tr>
								<tr><td align="center">상품명 : ${product.p_name}</td></tr>
								<tr><td align="center">상품가격 : ${product.p_price}</td></tr>
					<!-- 장바구니에 담기 위해 CartusubVO를 만들어줌 form post방식으로 데이터를 전달 -->
								<tr><td align="center">
								<form action="/shop/cart" method="post">
									<input type="hidden" name="p_code" value="${product.p_code}">
					<!-- foreach 구문(var="변수명" begin="시작" end="끝" step="단계") 을 사용하여 갯수 선택창 만들기 -->
									<select name="cs_cnt">
										<c:forEach var="count" begin="1" end="30" step="1">
											<option value="${count}">${count}개</option>										
										</c:forEach>
									</select>
									<input type="submit" value="장바구니">
									</form>
								</td></tr>
								</table>
								</td> <!-- 3으로 나눈 나머지가 2인그룹 -->
							</tr>
							</c:when>
							
							<c:otherwise>
							<td align="center" style="width:33.333%">
							<table>
								<tr><td align="center">상품번호 :${product.p_code}</td></tr>
								<tr><td align="center"><img alt="정보없음" src="/resources/product/${product.p_code}.jpg" height="200"></td></tr>
								<tr><td align="center">상품명 : ${product.p_name}</td></tr>
								<tr><td align="center">상품가격 : ${product.p_price}</td></tr>
								<tr><td align="center">
									<form action="/shop/cart" method="post">
									<input type="hidden" name="p_code" value="${product.p_code}">
				<!-- foreach 구문(var="변수명" begin="시작" end="끝" step="단계") 을 사용하여 갯수 선택창 만들기 -->
									<%-- <select name="cs_cnt">
										<c:forEach var="count" begin="1" end="30" step="1">
											<option value="${count}">${count}개</option>										
										</c:forEach>
									</select> --%>
									<!-- input num으로 만들기 -->
									<input type="number" name="cs_cnt" min="1" max="30" value="1" required>
									<input type="submit" value="장바구니">
									</form>
								</td></tr>
								</table>
							</td> <!-- 3으로 나눈 나머지가 1인그룹 -->
							</c:otherwise>
							
							</c:choose>
							
							<c:set var="cnt" value="${cnt+1}" /> <!-- cnt = cnt + 1 -->
						</c:forEach>
					
					
					
					
					
<%-- 	 			
						<c:forEach items="${list}" var="product">
							<tr>
								<td>${product.p_code}</td>
								
	<!-- ------글의 수정과 삭제를 위한 view page 링크를 name에 지정. 이후 Controller로 돌아가 역할설정-------- -->
								<td><a href="/product/view?p_code=${product.p_code}">${product.p_name}</a></td>
								<td>${product.p_price}</td>
				<!-- 작성일 부분은 길어지기 때문에 formating 실시 -->
								<td><img alt="정보없음" src="/resources/product/${product.p_code}.jpg" height="50"></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.p_rdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.p_udate}" /></td>
								
							</tr>
						</c:forEach> --%>
	
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp"%>