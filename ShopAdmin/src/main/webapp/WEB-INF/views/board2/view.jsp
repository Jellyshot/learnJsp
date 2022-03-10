<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>


<div class="container">
	<header>
	<h1>게시글 상세보기</h1>
	<p></p>
	<h6 class="m-0 font-weight-bold text-primary">
		<a href="/board/list?pageNum=${page.pageNum}">게시판 리스트로</a>
	</h6>
	</header>
	<br>

	<div class="col-sm-6 mb-3 mb-sm-0">
		<label>no.</label>
		<input type="text" class="form-control form-control-user" name="b_num" value="${board.b_num}" readonly>
	</div><br>
	
	<div class="col-sm-6 mb-3 mb-sm-0">
		<label>name</label>
		<input type="text" class="form-control form-control-user" name="b_name" value="${board.b_name}" readonly>
	</div><br>
	
	<div class="col-sm-6">
		<label>subject</label>
		<input type="text" class="form-control form-control-user" name="b_subject" value="${board.b_subject}" readonly>
	</div><br>
	
	<div class="form-group">
		<label>내용</label>
		<textarea rows="5" class="form-control" name="b_contents" readonly>${board.b_contents}</textarea>
	</div><br>
	
	<div class="form-group">
		<label>작성일</label>
		<input type="text" class="form-control form-control-user"
			value="${board.b_date}" readonly>
	</div><br>
	<div class=btn>
	<a href="/board/update?b_num=${board.b_num}&pageNum=${page.pageNum}" class="btn btn-primary btn-lg">[수정]</a>
	<a href="/board/delete?b_num=${board.b_num}" class="btn btn-primary btn-lg">[삭제]</a>
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