<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<h6 class="m-0 font-weight-bold text-primary">
		<a href="/product/list" >상품 리스트로 </a>
</h6><br>

<form class="user" method="post" action="/product/insert" style= "margin:16px;">
	
	<div class="col-sm-6 mb-3 mb-sm-0">
	<label>상품명</label>
	<input type="text" class="form-control form-control-user" name="p_name">
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
	<label>단가</label>
	<input type="text" class="form-control form-control-user" name="p_price">
	</div><br>

	<button type="submit" class="btn btn-primary btn-user btn-block">상품등록</button>
</form>
	
<!-- Bootstrap core JavaScript-->
<!-- <script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

Custom scripts for all pages
<script src="js/sb-admin-2.min.js"></script> -->

</body>

</html>

<%@ include file="../include/footer.jsp"%>