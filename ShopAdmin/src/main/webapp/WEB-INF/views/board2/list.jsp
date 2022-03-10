<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">board 리스트</h1>
	<p class="mb-4"></p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
			
	<!-- -----------------board Create 부분------------------------- -->		
				<a href="/board/insert" >게시판 글쓰기</a><span>&nbsp;${user}&nbsp;${age}</span>
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
					<tbody>
					
	<!--  ----- board Read 부분. forEach구문으로 하나씩 뽑아낸 레코드를 board에 하나씩 덮어쓰기함 ----- -->
						<c:forEach items="${list}" var="board">
							<tr>
								<td>${board.b_num}</td>
								
	<!-- ------글의 수정과 삭제를 위한 view page 링크를 만들어 준 후 Controller로 돌아가 역할설정-------- -->
								<td><a href="/board/view?b_num=${board.b_num}&pageNum=${pageview.page.pageNum}">${board.b_subject}</a></td>
								<!-- pageview.page.pageNum pageview안에 page라는 객체의 pageNum이라는 뜻 -->
								<td>${board.b_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.b_date}" /></td>
								<!-- 작성일 부분은 길어지기 때문에 formating 실시 -->
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
						
					<!-- ----------- 페이지네이션 ------------- -->
					<div align="center">
					
							<c:if test="${pageview.prev}">
								<a href="/board/list?pageNum=1">[<<]</a>&nbsp;&nbsp;
								<a href="/board/list?pageNum=${pageview.startPage-1}">[Prev]</a>&nbsp;&nbsp;
							</c:if>
												
							<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}"> 
								<c:if test="${pageview.page.pageNum == num}">
									<b><a href="/board/list?pageNum=${num}" style="color:black">[${num}]</a></b>&nbsp;&nbsp;
								</c:if>
								<c:if test="${pageview.page.pageNum != num}">
								<a href="/board/list?pageNum=${num}">[${num}]</a>&nbsp;&nbsp;
								</c:if>
							</c:forEach>
								
							<c:if test="${pageview.next}">
								<a href="/board/list?pageNum=${pageview.endPage+1}">[Next]</a>&nbsp;&nbsp;
								<a href="/board/list?pageNum=${pageview.realend}">[>>]</a>&nbsp;&nbsp;
							</c:if>
							
					</div>				
						
						
				
						
						
						
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

<%@ include file="../include/footer.jsp"%>
