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
	  <div class="card-header"><h3 class="text-center font-weight-light my-4">상품 등록</h3></div>
	  <form class="card-body" action="/product/insert" method="post"  >
	  
	    <div class="mb-3">
	  		<label for="exampleFormControlInput1" class="form-label">상품명</label>
	  		<input type="text" name="p_name" class="form-control" id="exampleFormControlInput1" placeholder="상품명을 입력하세요">
		</div>
	    <div class="mb-3">
	  		<label for="staticEmail" class="form-label">상품단가</label>
 	   	  <input type="text" name="p_price" class="form-control" id="staticEmail" placeholder="단가를 입력하세요">
		</div>
		<p><font color="red">*이미지 등록은 상세페이지에서 진행해 주세요</font></p>
		<div class="d-grid gap-2">
  		<input class="btn btn-secondary" type="submit" value="등록">
		</div>
	  </form>
	</div>

    
  
	
	
	</div>
	</div>
	</main>
</div>

<%@ include file="../include/footer.jsp"%>