<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


<div id="main">
	<section class="post">
		<header class="major">
			<span class="date">${serverTime}</span>
			<h1>공지사항</h1>
		</header>
		<p>이벤트 및 중요사항을 확인하세요.</p>
        	
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
                  <!--  ----- notice Read 부분. forEach구문으로 하나씩 뽑아낸 레코드를 notice에 하나씩 덮어쓰기함 ----- -->
                  <c:forEach items="${list}" var="notice">
                  <tr>
                      <td>${notice.n_num}</td>
                      <!-- ------글의 수정과 삭제를 위한 view page 링크를 만들어 준 후 Controller로 돌아가 역할설정-------- -->
                      <td><a href="/notice/view?n_num=${notice.n_num}&pageNum=${pageview.page.pageNum}">${notice.n_subject}</a></td>
                      <!-- pageview.page.pageNum pageview안에 page라는 객체의 pageNum이라는 뜻 -->
                      <td>${notice.n_name}</td>
                      <!-- 객체의 값 존재 유무를 따질때는 null, 문자열을 따질때는 ""이다. -->
				    <c:if test="${notice.n_file != null}">
				                     	 <!-- 첨부파일 다운로드 가능하게 하기. -->
				 	 <td align =center><i class='fas fa-file'></i></td>
				 	</c:if>
				   	<c:if test="${notice.n_file == null}">
							<td> </td>
				   	</c:if>
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
				
     </section>
    </div>

<%@ include file="../include/footer.jsp"%>
