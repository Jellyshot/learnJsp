<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


 <div id="main">
	<section class="post">
		<header class="major">
			<span class="date">${serverTime}</span>
			<h1>자유게시판</h1>
			<c:if test="${m_id != null}">
			<ul class="actions">
				<li><a href="/board2/insert"  class="button" >게시판 글쓰기</a></li>
			</ul>
			</c:if>
		</header>
        	
            <table id="datatablesSimple" class="dataTable-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>첨부파일</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <!--  ----- board Read 부분. forEach구문으로 하나씩 뽑아낸 레코드를 board에 하나씩 덮어쓰기함 ----- -->
                    <c:forEach items="${list}" var="board">
                    <tr>
                        <td>${board.b_num}</td>
                        <!-- ------글의 수정과 삭제를 위한 view page 링크를 만들어 준 후 Controller로 돌아가 역할설정-------- -->
                        <td><a href="/board2/view?b_num=${board.b_num}&pageNum=${pageview.page.pageNum}">${board.b_subject}</a></td>
                        <!-- pageview.page.pageNum pageview안에 page라는 객체의 pageNum이라는 뜻 -->
                        <td>${board.b_name}</td>
                        <!-- 객체의 값 존재 유무를 따질때는 null, 문자열을 따질때는 ""이다. -->
		     	     <c:if test="${board.b_file != null}">
		                            	 <!-- 첨부파일 다운로드 가능하게 하기. -->
		     		 	 <td align =center><a href="/board2/downLoad?b_num=${board.b_num}"><i class='fas fa-file'></i></a></td>
		        	</c:if>
		          	<c:if test="${board.b_file == null}">
		       			<td> </td>
		          	</c:if>
		          	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_date}" /></td>
		          <!-- 작성일 부분은 길어지기 때문에 formating 실시 -->
		         </tr>
		            </c:forEach>
	            </tbody>
	        </table>

          	<!-- ----------- 페이지네이션 ------------- -->
					<div align="center">
					
							<c:if test="${pageview.prev}">
								<a href="/board2/list?pageNum=1">[<<]</a>&nbsp;&nbsp;
								<a href="/board2/list?pageNum=${pageview.startPage-1}">[Prev]</a>&nbsp;&nbsp;
							</c:if>
												
							<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}"> 
								<c:if test="${pageview.page.pageNum == num}">
									<b><a href="/board2/list?pageNum=${num}" style="color:black">[${num}]</a></b>&nbsp;&nbsp;
								</c:if>
								<c:if test="${pageview.page.pageNum != num}">
								<a href="/board2/list?pageNum=${num}">[${num}]</a>&nbsp;&nbsp;
								</c:if>
							</c:forEach>
								
							<c:if test="${pageview.next}">
								<a href="/board2/list?pageNum=${pageview.endPage+1}">[Next]</a>&nbsp;&nbsp;
								<a href="/board2/list?pageNum=${pageview.realend}">[>>]</a>&nbsp;&nbsp;
							</c:if>
							
					</div>				
      </section>
  </div>



<%@ include file="../include/footer.jsp"%>
