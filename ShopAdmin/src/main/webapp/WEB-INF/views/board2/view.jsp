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
                     <div class="card-header"><h3 class="text-center font-weight-light my-4">View Detail</h3></div>
                     <div class="card-body">
        
						<button><a class="btn btn-light" href="/board2/list?pageNum=${page.pageNum}" >리스트로</a></button>

                         <div class="row mb-3">
                             <div class="col-md-6">
                                 <div class="form-floating mb-3 mb-md-0">
                                     <input class="form-control" name="b_num" id="inputFirstName" type="text" value="${board.b_num}"  readonly/>
                                     <label for="inputFirstName">No.</label>
                                 </div>
                                 <div class="form-floating mb-3 mb-md-0">
                                     <input class="form-control" name="b_name" id="inputFirstName" type="text" value="${board.b_name}"  readonly/>
                                     <label for="inputFirstName">Name</label>
                                 </div>
                              </div>
                          <div class="row mb-3">
                              <div class="col-md-6">
                                  <div class="form-floating">
                                      <input class="form-control" name="b_subject" id="inputLastName" type="text" value="${board.b_subject}" readonly/>
                                      <label for="inputLastName">Subject</label>
                                  </div>
                              </div>
                          </div>
                          </div>
                          <div class="row mb-3">
                              <div class="col-md-6">
									<label for="b_contents">Contents</label>
									<textarea rows="5" class="form-control" name="b_contents" readonly>${board.b_contents}</textarea>
							  </div>
                              <div class="form-floating mb-3 mb-md-0">
                                  <input class="form-control" id="inputPassword" type="file" value="${board.b_subject}" name="b_file" readonly/>
                              </div>
                          </div>
       					  <div class="row mb-3">		
                               <div class="col-md-6">				
									<label for="b_date">Contents</label>
									<textarea rows="5" class="form-control" name="b_date" readonly>${board.b_date}</textarea>
								</div>
						</div>
                        <div class="mt-4 mb-0">
                                  <div class="d-grid">
										<a href="/board2/update?b_num=${board.b_num}&pageNum=${page.pageNum}" class="btn btn-primary btn-lg">[수정]</a>
										<a href="/board2/delete?b_num=${board.b_num}" class="btn btn-primary btn-lg">[삭제]</a>
									</div>
                          </div>
                    </div>
                 </div>
            </div>
         </div>
     </div>
     </main>
</div>





<%@ include file="../include/footer.jsp"%>