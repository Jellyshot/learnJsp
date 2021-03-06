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
                  <!-- -----------------board Create 부분------------------------- -->		
                  <li><a href="/board2/insert"  class="btn btn-outline-primary btn-sm mt-3" >게시판 글쓰기</a></li>
              </ol>
                <div class="card mb-4">
                  <div class="card-header">
                      <i class="fas fa-table me-1"></i>
                      DataTable Example
                  </div>
                  <div class="card-body">
                    <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                    <div class="dataTable-search">
                    <input class="dataTable-input" placeholder="Search..." type="text">
                    </div></div><div class="dataTable-container">
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
                      </div><div class="dataTable-bottom">
						</div>
                  </div>
              </div>
          </div>
          
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
								<a href="/board2list?pageNum=${pageview.endPage+1}">[Next]</a>&nbsp;&nbsp;
								<a href="/board2/list?pageNum=${pageview.realend}">[>>]</a>&nbsp;&nbsp;
							</c:if>
							
					</div>				
      </main>
  </div>



<%@ include file="../include/footer.jsp"%>
