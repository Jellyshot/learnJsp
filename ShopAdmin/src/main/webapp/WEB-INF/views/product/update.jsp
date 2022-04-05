<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
	function ImgWinOpen(p_code){
		window.open("/product/imgupload?p_code="+p_code,"상품이미지등록","width=500,height=220,resizeable=1")
	}
</script>
 
<div id="layoutSidenav_content">        
    <main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5">
    <div class="card my-4">
	  <div class="card-header"><h3 class="text-center font-weight-light my-4">상품 정보 수정</h3></div>
	<div class="card-body">
  		<div class="mb-3">
  			<img alt="이미지 준비중" src="/resources/product/${product.p_code}.jpg">
	  		<input type="button" value="이미지수정" class="form-control" onclick="ImgWinOpen('${product.p_code}')">
  		</div>
	  <form action="/product/update?pageNum=${page.pageNum}" method="post"  >
	    <div class="mb-3">
	    	<input type="hidden" name="p_code" value="${product.p_code}"/>
	  		<label for="exampleFormControlInput1" class="form-label">상품명</label>
	  		<input type="text" name="p_name" class="form-control" id="exampleFormControlInput1" value="${product.p_name}">
		</div>
	    <div class="mb-3">
	  		<label for="staticEmail" class="form-label">상품단가</label>
 	   	  <input type="text" name="p_price" class="form-control" id="staticEmail" value="${product.p_price}">
    
		</div>
		<div class="d-grid gap-2">
  		<input class="btn btn-secondary" type="submit" value="등록">
		</div>
	  </form>
	  </div>
	</div>

    
  
	
	
	</div>
	</div>
	</main>
</div>

<%@ include file="../include/footer.jsp"%>