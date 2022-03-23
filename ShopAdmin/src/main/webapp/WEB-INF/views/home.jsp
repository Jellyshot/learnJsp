<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>

<script src="/resources/js/calender.js"></script>

          
<div id="layoutSidenav_content">        
  
  <!-- 메인 페이지 -->
     <main>
         <div class="container-fluid px-4">
             <h1 class="mt-4">관리자 페이지</h1>
             <c:if test="${a_id != null }">
             <ol class="breadcrumb my-4">
                 <li class="breadcrumb-item active">로그인중인 아이디 : <b>${a_id}</b></li>
             </ol>
 				
 <table id="calendar" align="center" class="table">
 	<thead>
		<tr>
			<td align="center"><label onclick="prevCalendar()" class="hk"> ◀ </label></td>
			<td colspan="5" align="center" id="calendarTitle">yyyy년 <b>m월</b></td>
			<td align="center"><label onclick="nextCalendar()" class="hk"> ▶ </label></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td align="center"><font color ="#F79DC2">일</td>
			<td align="center">월</td>
			<td align="center">화</td>
			<td align="center">수</td>
			<td align="center">목</td>
			<td align="center">금</td>
			<td align="center"><font color ="skyblue">토</td>
		</tr>
	</tbody>
	<tfoot>
		<script type="text/javascript">buildCalendar();</script>
	</tfoot>
	</table>
				
				
             </c:if>
             
             <c:if test="${a_id == null }">
             <ol class="breadcrumb my-4">
                 <li class="breadcrumb-item active"><h2>관리자로 로그인되지 않았습니다.</h2></li>
             </ol>
             
             <div class="row">
             	<div class="col-xl-3 col-md-6">
                    <div class="card bg-primary text-white mb-4">
                        <div class="card-body">
                        	 <a class="small text-white stretched-link" href="/admin/login">로그인</a>
						</div>
                    </div>
                 </div>
                </div>
           </c:if>
           </div>
      </main>
</div>


<%@ include file="./include/footer.jsp"%>        