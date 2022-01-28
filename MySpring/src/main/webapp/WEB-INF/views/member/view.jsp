<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


<div class="container">

<!-- view header -->
	<header>
	<h1>회원정보 상세보기</h1>
	<p></p>
	<h6 class="m-0 font-weight-bold text-primary">
		<a href="/board/list">게시판 리스트로</a>
	</h6>
	</header>
	<br>


	<div class="col-sm-6 mb-3 mb-sm-0">
		<label>no.</label>
		<input type="text" class="form-control form-control-user" name="m_id" value="${member.m_id}" readonly>
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
		<label>name</label>
		<input type="text" class="form-control form-control-user" name="m_name" value="${member.m_name}" readonly>
	</div><br>
	
	<div class="col-sm-6">
		<label>subject</label>
		<input type="text" class="form-control form-control-user" name="m_rdate" value="${member.m_rdate}" readonly>
	</div><br>
	
	<div class="col-sm-6">
		<label>subject</label>
		<input type="text" class="form-control form-control-user" name="m_udate" value="${member.m_udate}" readonly>
	</div><br>
	
	<div class=btn>
	<a href="/member/update?m_id=${member.m_id}" class="btn btn-primary btn-lg">[수정]</a>
	<a href="/member/delete?m_id=${member.m_id}" class="btn btn-primary btn-lg">[삭제]</a>
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