<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<h1 class="h3 mb-2 text-gray-800">리스트</h1>
	<p class="mb-4"></p>
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">			
		<h6 class="m-0 font-weight-bold text-primary">
<!-- -----------------  insert 링크 부분------------------------- -->		
			<a href="/notice/insert" >게시판 글쓰기</a>
		</h6>
		</div>
	<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered" width="100%" cellspacing="0">
		<thead>
			<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			</tr>
		</thead>
	
<!--  ----- notice Read 부분. Controller에서 getList로 받은 "list"에 담긴 데이터를 forEach구문으로 하나씩 뽑아내 notice 변수에 하나씩 덮어쓰기함 ----- -->
		<tbody>
		<c:forEach items="${list}" var="notice">
			<tr>
			<td>${notice.n_num}</td>
<!-- ----- 제목에 view 링크를 걸어주어서 수정과 삭제를 view페이지에서 할 수 있도록 함.  ----- -->
			<td><a href="/notice/view?n_num=${notice.n_num}&pageNum=${pageview.page.pageNum}">${notice.n_subject}</a></td>
			<td>${notice.n_name}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.n_date}" /></td>
			<!-- 작성일 부분은 길어지기 때문에 formating 실시 -->
			</tr>
		</c:forEach>
		</tbody>
		</table>
		
		<!-- ----------- 페이지네이션 ------------- -->
					<div align="center">
					
							<c:if test="${pageview.prev}">
								<a href="/notice/list?pageNum=1">[<<]</a>&nbsp;&nbsp;
								<a href="/notice/list?pageNum=${pageview.startPage-1}">[Prev]</a>&nbsp;&nbsp;
							</c:if>
												
							<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}"> 
								<c:if test="${pageview.page.pageNum == num}">
									<b><a href="/notice/list?pageNum=${num}" style="color:black">[${num}]</a></b>&nbsp;&nbsp;
								</c:if>
								<c:if test="${pageview.page.pageNum != num}">
								<a href="/notice/list?pageNum=${num}">[${num}]</a>&nbsp;&nbsp;
								</c:if>
							</c:forEach>
								
							<c:if test="${pageview.next}">
								<a href="/notice/list?pageNum=${pageview.endPage+1}">[Next]</a>&nbsp;&nbsp;
								<a href="/notice/list?pageNum=${pageview.realend}">[>>]</a>&nbsp;&nbsp;
							</c:if>
							
					</div>
					
					
		</div>
	</div>
	</div>
</div>


									