<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


 
<div id="layoutSidenav_content">  
         <main>
           <div class="container">
               <div class="row justify-content-center">
                   <div class="col-lg-7">
                       <div class="card shadow-lg border-0 rounded-lg mt-5">
                           <div class="card-header"><h3 class="text-center font-weight-light my-4">회원정보 수정</h3></div>
                           <div class="card-body">
   
							<a class="btn btn-primary my-3" href="/member/list" role="button">리스트로 돌아가기</a>

                               <form action="/member/update?pageNum=${page.pageNum}" method="post">
                                 <div class="row mb-3 md-6">

                                         <div class="form-floating mb-3 mb-md-0">
                                             <input class="form-control mb-3" id="inputId" type="text" name="m_id" value="${member.m_id}" readonly/>
                                             <label for="inputId">아이디</label>
                                    	</div>	                                                
                                         <div class="form-floating my-3">
                                             <a href="/member/upasswd" id="inputPasswd" class="btn btn-primary btn-sm">비밀번호 변경</a>
                                    	</div>	

                                         <div class="form-floating mb-3 mb-md-0 ">
                                             <input class="form-control mb-3" id="inputLastName" type="text" value="${member.m_name}" name="m_name"/>
                                             <label for="inputLastName">이름</label>
                                         </div>
                                         <div class="form-floating mb-3 mb-md-0 ">
                                             <input class="form-control mb-3" id="inputCurrentFile" type="text" value="${member.m_phone}" name="m_phone"/>
                                             <label for="CurrentFile">연락처</label>
                                         </div>
                                 </div>
                                 <div class="mt-4 mb-0">
                                 <div class="d-grid">
                                 	<input type="submit" class="btn btn-primary btn-block" value="수정" />
                              	</div>
                                 </div>
                             </form>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </main>
 </div>



<%@ include file="../include/footer.jsp"%>