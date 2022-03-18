<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>

          
<div id="layoutSidenav_content">        
  
  <!-- 메인 페이지 -->
     <main>
         <div class="container-fluid px-4">
             <h1 class="mt-4">관리자 페이지</h1>
             <c:if test="${a_id != null }">
             <ol class="breadcrumb my-4">
                 <li class="breadcrumb-item active">로그인중인 아이디 : <b>${a_id}</b></li>
             </ol>
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