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
	
<!--  ----- board Read 부분. Controller에서 getList로 받은 "list"에 담긴 데이터를 forEach구문으로 하나씩 뽑아내 notice 변수에 하나씩 덮어쓰기함 ----- -->
		<tbody>
		<c:forEach items="${list}" var="notice">
			<tr>
			<td>${notice.b_num}</td>
<!-- ----- 제목에 view 링크를 걸어주어서 수정과 삭제를 view페이지에서 할 수 있도록 함.  ----- -->
			<td><a href="/notice/view?b_num=${notice.b_num}">${notice.b_subject}</a></td>
			<td>${notice.b_name}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.b_date}" /></td>
			<!-- 작성일 부분은 길어지기 때문에 formating 실시 -->
			</tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
	</div>
	</div>
</div>


									