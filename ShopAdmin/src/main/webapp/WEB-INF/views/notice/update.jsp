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
                           <div class="card-header"><h3 class="text-center font-weight-light my-4">공지사항 수정</h3></div>
                           <div class="card-body">
   
							<a class="btn btn-primary mb-3" href="/notice/list" role="button">리스트로 돌아가기</a>

                               <form action="/notice/update?pageNum=${page.pageNum}" method="post" enctype="multipart/form-data">
                                 <div class="row mb-3 md-6">

                                         <div class="form-floating mb-3 mb-md-0">
                                             <input class="form-control mb-3" id="inputFirstName" type="text" name="n_num" value="${notice.n_num}" readonly/>
                                             <label for="inputFirstName">No.</label>
                                    	</div>	                                                
                                         <div class="form-floating mb-3 mb-md-0">
                                             <input class="form-control mb-3" id="inputFirstName" type="text" name="n_name" value="${notice.n_name}" readonly/>
                                             <label for="inputFirstName">Name</label>
                                    	</div>	

                                         <div class="form-floating mb-3 mb-md-0 ">
                                             <input class="form-control mb-3" id="inputLastName" type="text" value="${notice.n_subject}" name="n_subject" />
                                             <label for="inputLastName">Subject</label>
                                         </div>
                                         <div class="form-floating mb-3 mb-md-0 ">
                                             <input class="form-control mb-3" id="inputCurrentFile" type="text" value="${notice.n_file}" name="n_fileold"  readonly/>
                                             <label for="CurrentFile">Current File</label>
                                         </div>
                                 </div>
                                 <div class="form-floating mb-3 mb-md-0">
									<p>Contents</p>
									<textarea rows="5" class="d-grid mb-3" name="n_contents" style="width:100%">${notice.n_contents}</textarea>
                                	<input class="form-control mb-3" id="inputPassword" type="file" name="n_file" />
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