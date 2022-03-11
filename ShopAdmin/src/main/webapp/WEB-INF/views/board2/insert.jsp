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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Board2</h3></div>
                                    <div class="card-body">
            
									<a class="btn btn-primary mb-3" href="/board2/list" role="button">List</a>


                                        <form action="/board2/insert" method="post" enctype="multipart/form-data">
                                            <div class="row mb-3 md-6">
                                                
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control mb-3" id="inputFirstName" type="text" placeholder="Enter your first name" name="b_name" />
                                                        <label for="inputFirstName">Name</label>
                                                	</div>	

                                                    <div class="form-floating mb-3 mb-md-0 ">
                                                        <input class="form-control mb-3" id="inputLastName" type="text" placeholder="Enter your last name" name="b_subject" />
                                                        <label for="inputLastName">Subject</label>
                                                    </div>

                                            </div>
                                            <div class="form-floating mb-3 mb-md-0">
														<label for="b_contents">Contents</label>
														<textarea rows="5" class="d-grid mb-3" name="b_contents" style="width:100%"></textarea>
                                                    
                                                        <input class="form-control mb-3" id="inputPassword" type="file" placeholder="file attached" name="b_file" />
                                                    
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><button type="submit" class="btn btn-primary btn-block">Write</button></div>
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