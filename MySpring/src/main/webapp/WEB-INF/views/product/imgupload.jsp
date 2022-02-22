<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
	<head>
		<script>
			function winclose(){
				opener.location.reload();
				window.close();
			}
			/* opener: 부모창, reload: 갱신 */
		</script>
	</head>
	<body>
	
	<h1>상품 이미지 등록</h1>
	<form action="/product/imgupload" method="post" enctype="multipart/form-data">
		상품코드 : <input type="text" name="p_code" value="${p_code}" style="border:none" readonly><br>
		<p>업로드할 이미지를 선택해 주세요
		<input type="file" name="p_img"></p>
		<input type="submit" value="저장" style="float:right">
	</form>
	<a href="javascript:winclose()" style="float:right">닫기</a>
	
	</body>
</html>