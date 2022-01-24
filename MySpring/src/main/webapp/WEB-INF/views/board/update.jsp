<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div class="container">
<h1>수정하기</h1>
<h6 class="m-0 font-weight-bold text-primary">
		<a href="/board/list" >게시판 리스트로</a>
</h6><br>
<form class="user" method="post" action="/board/update" style= "margin:16px;">

	<div class="col-sm-6 mb-3 mb-sm-0">
	<input type="text" class="form-control form-control-user"
				name="b_num" value="${board.b_num}" readonly>
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
	<input type="text" class="form-control form-control-user"
				name="b_name" value="${board.b_name}" readonly>
	</div><br>
	<div class="col-sm-6">
		<input type="text" class="form-control form-control-user"
				name="b_subject" value="${board.b_name}">
	</div><br>
	<div class="form-group">
		<label>내용</label>
		<textarea rows="5" class="form-control" name="b_contents">
		${board.b_name}
		</textarea>
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