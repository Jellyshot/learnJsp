<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

 
<div id="layoutSidenav_content">        
    <main>
    <div class="container">
    <div class="row justify-content-center my-5">
    <div class="card">
	  <div class="card-header"><h3 class="text-center font-weight-light my-4">공지사항 등록</h3></div>
	  <form class="card-body" action="/notice/insert" method="post" enctype="multipart/form-data" >
	  
	    <div class="mb-3">
	  		<label for="exampleFormControlInput1" class="form-label">제목</label>
	  		<input type="text" name="n_subject"class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요">
		</div>
	    <div class="mb-3">
	  		<label for="exampleFormControlInput1" class="form-label">작성자</label>
 	   	  <input type="text" name="n_name" class="form-control-plaintext" id="staticEmail" value="관리자" readonly/>
    
		</div>
		<div class="mb-3">
	  		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
	  		<textarea name = "n_contents" class="form-control" id="exampleFormControlTextarea1" rows="15" placeholder="내용을 입력하세요"></textarea>
		</div>
	    <div class="mb-3">
	  		<input type="file" name="n_file"class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요">
		</div>
		<div class="d-grid gap-2">
  		<input class="btn btn-secondary" type="submit">
		</div>
	  </form>
	</div>

    
  
	
	
	</div>
	</div>
	</main>
</div>

<%@ include file="../include/footer.jsp"%>