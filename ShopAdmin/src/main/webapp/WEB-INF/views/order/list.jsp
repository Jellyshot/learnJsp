<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


 <div id="layoutSidenav_content">
      <main>
     
       <div class="container-fluid px-4">
        <h1 class="mt-4"><i class="fas fa-shopping-cart"></i> 주문관리</h1>
                
      	<div class="card mb-4">
            <div class="card-header">
                <svg class="svg-inline--fa fa-table fa-w-16 me-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg>
                <!-- <i class="fas fa-table me-1"></i> Font Awesome fontawesome.com -->
                Dream Shop 주문정보	
            </div>
            <div class="card-body">
                <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns search-results">
	                <div class="dataTable-top">
	                	<div class="dataTable-search">
	                		<input class="dataTable-input" placeholder="Search..." type="text">
                		</div>
               		</div>
         			<div class="dataTable-container">
         				<table id="datatablesSimple" class="dataTable-table">

	                    <thead>
						 <tr>
	                          <th>주문번호</th>
	                          <th>주문일</th>
	                          <th>회원ID</th>
	                          <th>회원명</th>
	                          <th>배송상태</th>
	                          <th>상품코드</th>
	                          <th>상품명</th>
	                          <th>갯수</th>
	                          <th>상품단가</th>
	                          <th>합계금액</th>
	                          <th>연락처</th>
	                          <th>배송주소</th>
	                          <th>우편번호</th>
	                          <th collapse="2" >비고</th>
	                      </tr>
	                   </thead>
	                  
	                    <tbody>
                        <!--  ----- forEach구문으로 하나씩 뽑아낸 레코드를 ordermanage에 하나씩 덮어쓰기함 ----- -->
                              <c:forEach items="${list}" var="ordermanage">
                              <tr>
		       		              <th>${ordermanage.om_code}</th>
		                          <th>${ordermanage.om_rdate}</th>
		                          <th>${ordermanage.m_id}</th>
		                          <th>${ordermanage.m_name}</th>
		                          <th>${ordermanage.om_status}</th>
		                          <th>${ordermanage.p_code}</th>
		                          <th>${ordermanage.p_name}</th>
		                          <th>${ordermanage.os_cnt}</th>
		                          <th>${ordermanage.p_price}</th>
		                          <th>${ordermanage.os_price}</th>
		                          <th>${ordermanage.m_phone}</th>
		                          <th>${ordermanage.a_address01} ${ordermanage.a_address02}</th>
		                          <th>${ordermanage.a_zipcode}</th>
                                  <td><form action="/order/update?om_code=${ordermanage.om_code}" method="post">
                                  	<select name="om_status">
<%--                                   	<c:choose>
                                  	<c:when test="${om_status eq 'order'}">
                                  		<option value="order" selected >배송대기</option>
                                  		<option value="released">출고완료</option>
                                  		<option value="complete">배송완료</option>
                                  	</c:when>
                                  	<c:when test="${om_status eq 'released'}">
                                  		<option value="order" >배송대기</option>
                                  		<option value="released" selected>출고완료</option>
                                  		<option value="complete">배송완료</option>
                                  	</c:when>
                                  	<c:when test="${om_status eq 'complete'}">
                                  		<option value="order" >배송대기</option>
                                  		<option value="released">출고완료</option>
                                  		<option value="complete" selected>배송완료</option>
                                  	</c:when>
                                  	</c:choose> --%>
                                  	<c:if test="${ordermanage.om_status eq 'order'}">
                                  		<option value="order" selected >배송대기</option>
                                  		<option value="released">출고완료</option>
                                  		<option value="complete">배송완료</option>
                                  	</c:if>
                                  	<c:if test="${ordermanage.om_status eq 'released'}">
                                  		<option value="order" >배송대기</option>
                                  		<option value="released" selected>출고완료</option>
                                  		<option value="complete">배송완료</option>
                                  	</c:if>
                                  	<c:if test="${ordermanage.om_status eq 'complete'}">
                                  		<option value="order" >배송대기</option>
                                  		<option value="released">출고완료</option>
                                  		<option value="complete" selected>배송완료</option>
                                  	</c:if>
                                  	</select>	
                                  	<input type="submit" value="수정" />
                                  </form></td>
                                  <td><a href="/order/view?b_num=${board.b_num}&pageNum=${pageview.page.pageNum}">삭제</a></td>
                                  <td>${board.b_subject}</a></td>
                                  <!-- pageview.page.pageNum pageview안에 page라는 객체의 pageNum이라는 뜻 -->
                                  <td>${om.b_name}</td>
					          	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_date}" /></td>
					          <!-- 작성일 부분은 길어지기 때문에 formating 실시 -->
					         </tr>
					            </c:forEach>
	                  	</tbody>
	                </table></div><div class="dataTable-bottom"><div class="dataTable-info">Showing 1 to 1 of 1 entries</div><nav class="dataTable-pagination"><ul class="dataTable-pagination-list"></ul></nav></div></div>
	            </div>
	        </div>
	      </div>
      
      
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
      </main>
  </div>



<%@ include file="../include/footer.jsp"%>
