<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
	function ImgWinOpen(p_code){
		window.open("/product/imgupload?p_code="+p_code,"상품등록","width=500,height=200,resizable=1")
		/* 윈도우 새 창을 띄우는 자바스크립트: window.open("url","윈도우명칭(보통 비움)","창의 크기(쉼표없이 기재.)")
		자바스크립트에서 문자열을 결합하는 방식은 + 이다. (php에서의 .) +뒤의 p_code 는 함수 ImgWinOpen의 파라미터 값*/
	}
</script>

<div class="container">

<!-- view header -->
	<header>
	<h1>상품정보 상세보기</h1>
	<p></p>
	<h6 class="m-0 font-weight-bold text-primary">
		<a href="/product/list">상품 리스트로</a>
	</h6>
	</header>
	<br>
	<div class="col-sm-6 mb-3 mb-sm-0">
	<img alt="이미지 준비중" src="/resources/product/${product.p_code}.jpg" height="100" >
	</div><br>
	
	<div class=btn>	
	<!-- 이미지를 저장하기 위한 ImgWinOpen 함수 선언 및 이름으로 저장할 p_code 파라미터를 전달 -->
	<input type="button" value="이미지등록" class="form-control" onclick="ImgWinOpen('${product.p_code}')">
	</div>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
		<label>상품번호</label>
		<input type="text" class="form-control form-control-user" name="p_code" value="${product.p_code}" readonly>
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
		<label>상품명</label>
		<input type="text" class="form-control form-control-user" name="p_name" value="${product.p_name}" readonly>
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
		<label>상품가격</label>
		<input type="text" class="form-control form-control-user" name="p_name" value="${product.p_price}" readonly>
		
	</div><br>
	
	<div class="col-sm-6">
		<label>등록일</label>
		<input type="text" class="form-control form-control-user" name="p_rdate" value="${product.p_rdate}" readonly>
	</div><br>
	
	<div class="col-sm-6">
		<label>수정일</label>
		<input type="text" class="form-control form-control-user" name="p_udate" value="${product.p_udate}" readonly>
	</div><br>
	
	<div class=btn>
	<a href="/product/update?p_code=${product.p_code}" class="btn btn-primary btn-lg">[수정]</a>
	<a href="/product/delete?p_code=${product.p_code}" class="btn btn-primary btn-lg">[삭제]</a>
	</div>
</div>



<!-- Bootstrap core JavaScript-->
<!-- <script src="vendor/jquery/jquery.min.js"></script> -->
<!-- <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

Custom scripts for all pages
<script src="js/sb-admin-2.min.js"></script> -->

</body>

</html>

<%@ include file="../include/footer.jsp"%>