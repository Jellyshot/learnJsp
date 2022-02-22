<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품 리스트</h1>
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
					<thead>
						<tr>
							<td>상품코드</td>
							<td>상품명</td>
							<td>단가</td>
							<td>이미지</td>
							<td>등록일</td>
							<td>수정일</td>
						</tr>
					</thead>
	<!--  ----- product Read 부분. forEach구문으로 하나씩 뽑아낸 레코드를 product에 하나씩 덮어쓰기함
				해당 쿼리는 JSPL 문으로, 필수 속성값으로 item(List, Map, Array), var(사용할 변수명)을 가진다. 
				반복문 사용후 닫아줘야함----- -->
					<tbody>
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
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp"%>
