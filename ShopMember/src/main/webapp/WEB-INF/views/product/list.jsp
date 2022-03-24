<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div id="layoutSidenav_content">
      <main>
      
          <div class="container-fluid px-4">
              <h1 class="mt-4">상품 목록</h1>
              <ol class="breadcrumb mb-4">
                  <!-- -----------------Product Insert 부분------------------------- -->		
                  <li><a href="/product/insert" class="btn btn-outline-primary btn-sm mt-3" >상품 등록</a></li>
              </ol>
                <div class="card mb-4">
                  <div class="card-header">
                      <i class="fas fa-table me-1"></i>
                      상품 목록
                  </div>
                  <div class="card-body">
                    <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                    <div class="dataTable-top">

                    <div class="dataTable-search">
                    <input class="dataTable-input" placeholder="Search..." type="text">
                    </div></div><div class="dataTable-container">
                      <table id="datatablesSimple" class="dataTable-table">
                          <thead>
                              <tr>
                                  <th>상품코드</th>
                                  <th>상품명</th>
                                  <th>단가</th>
                                  <th>이미지</th>
                                  <th>등록일</th>
                                  <th>정보수정일</th>
                              </tr>
                          </thead>
                          <tbody>
                              <!--  ----- product Read 부분. forEach구문으로 하나씩 뽑아낸 레코드를 board에 하나씩 덮어쓰기함 
			해당 쿼리는 item에 List, Map, Array 객체를 가지며 var에는 사용할 변수명을 입력한다. ----- -->
                              <c:forEach items="${list}" var="product">
                              <tr>
                                  <td><a href="/product/view?p_code=${product.p_code}&pageNum=${pageview.page.pageNum}">${product.p_code}</a></td>
                                  <!-- ------글의 수정과 삭제를 위한 view page 링크를 만들어 준 후 Controller로 돌아가 역할설정-------- -->
                                  <td>${product.p_name}</td>
                                  <td>${product.p_price}</td>
                                  <td><img alt="이미지 준비중" src="/resources/product/${product.p_code}.jpg" height="100"></td>
                                 
					          	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.p_rdate}" /></td>
					          	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.p_udate}" /></td>
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
								<a href="/product/list?pageNum=1">[<<]</a>&nbsp;&nbsp;
								<a href="/product/list?pageNum=${pageview.startPage-1}">[Prev]</a>&nbsp;&nbsp;
							</c:if>
												
							<c:forEach var="num" begin="${pageview.startPage}" end="${pageview.endPage}"> 
								<c:if test="${pageview.page.pageNum == num}">
									<b><a href="/product/list?pageNum=${num}" style="color:black">[${num}]</a></b>&nbsp;&nbsp;
								</c:if>
								<c:if test="${pageview.page.pageNum != num}">
								<a href="/product/list?pageNum=${num}">[${num}]</a>&nbsp;&nbsp;
								</c:if>
							</c:forEach>
								
							<c:if test="${pageview.next}">
								<a href="/product/list?pageNum=${pageview.endPage+1}">[Next]</a>&nbsp;&nbsp;
								<a href="/product/list?pageNum=${pageview.realend}">[>>]</a>&nbsp;&nbsp;
							</c:if>
		</div>			
				
					</div>				
      </main>
  </div>


<%@ include file="../include/footer.jsp"%>