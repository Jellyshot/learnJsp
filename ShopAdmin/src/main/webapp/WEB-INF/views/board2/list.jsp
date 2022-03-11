<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


 <div id="layoutSidenav_content">
      <main>
          <div class="container-fluid px-4">
              <h1 class="mt-4">Board List</h1>
              <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                  <!-- -----------------board Create 부분------------------------- -->		
                  <li><a href="/board2/insert" >게시판 글쓰기</a><span>&nbsp;${user}&nbsp;${age}</span></li>
              </ol>
                <div class="card mb-4">
                  <div class="card-header">
                      <i class="fas fa-table me-1"></i>
                      DataTable Example
                  </div>
                  <div class="card-body">
                      <table id="datatablesSimple">
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
                  </div>
              </div>
          </div>
      </main>
  </div>



<%@ include file="../include/footer.jsp"%>
