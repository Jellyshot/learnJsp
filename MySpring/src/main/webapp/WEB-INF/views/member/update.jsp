<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div class="container">
<header>
	<h1>회원정보 수정하기</h1>
	<h6 class="m-0 font-weight-bold text-primary">
			<a href="/member/list" >회원정보 리스트로</a>
	</h6><br>
</header>

<form class="user" method="post" action="/member/update" style= "margin:16px;">

	<div class="col-sm-6 mb-3 mb-sm-0">
	<input type="text" class="form-control form-control-user"
				name="m_id" value="${member.m_id}" readonly>
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
	<input type="hidden" class="form-control form-control-user"
				name="m_passwd" value="${member.m_passwd}">
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
	<input type="text" class="form-control form-control-user"
				name="m_name" value="${member.m_name}">
	</div><br>
	
	<input type="submit" class="btn btn-primary btn-user btn-block" value="수정">
</form>
	
<!-- Bootstrap core JavaScript-->
<!-- <script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

Custom scripts for all pages
<script src="js/sb-admin-2.min.js"></script> -->
</div>
</body>

</html>

<%@ include file="../include/footer.jsp"%>