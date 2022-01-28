<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<h6 class="m-0 font-weight-bold text-primary">
		<a href="/member/list" >회원정보 리스트로 </a>
</h6><br>

<form class="user" method="post" action="/member/insert" style= "margin:16px;">
	
	<div class="col-sm-6">
		<input type="text" class="form-control form-control-user" name="m_id" placeholder="ID">
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
	<input type="text" class="form-control form-control-user" name="m_name" placeholder="Name">
	</div><br>

	<button type="submit" class="btn btn-primary btn-user btn-block">회원등록</button>
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