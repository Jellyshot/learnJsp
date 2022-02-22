<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회원 리스트</h1>
	<p class="mb-4"></p>

	<!-- Page Section -->
	<div class="card shadow mb-4">
	
		<!-- 회원등록 버튼 -->
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="/member/insert">회원등록</a>
			</h6>
		</div>
		<!-- 리스팅 시작 -->
		<div class="card-body">
			<div class="table-responsive" style="boder:1px">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<td>아이디</td>
							<td>비밀번호</td>
							<td>이름</td>
							<td>가입일</td>
							<td>정보수정일</td>
						</tr>
					</thead>
	<!--  ----- member Read 부분. forEach구문으로 하나씩 뽑아낸 레코드를 member에 하나씩 덮어쓰기함
				해당 쿼리는 JSPL 문으로, 필수 속성값으로 item(List, Map, Array), var(사용할 변수명)을 가진다. 
				반복문 사용후 닫아줘야함----- -->
					<tbody>
						<c:forEach items="${list}" var="member">
							<tr>
								<td>${member.m_id}</td>
								<td>${member.m_passwd}</td>
	<!-- ------글의 수정과 삭제를 위한 view page 링크를 name에 지정. 이후 Controller로 돌아가 역할설정-------- -->
								<td><a href="/member/view?m_id=${member.m_id}">${member.m_name}</a></td>
				<!-- 작성일 부분은 길어지기 때문에 formating 실시 -->
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_rdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.m_udate}" /></td>
								
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
