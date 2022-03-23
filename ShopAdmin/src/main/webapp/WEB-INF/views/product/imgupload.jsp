<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Spring Shop</title>
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
		<script>
			function winclose(){
  			var thisform = document.Writeform;
				thisform.action="/product/imgupload";
				thisform.method="post";
				thisform.submit();
				/* Promise(resolve => setTimeout(resolve, 3000)).then(()=>window.open("about:blank", "_self").close());
				/* opener.location.reload(); 
				window.open("about:blank", "_self").close(); */
				
	/* 			opener.location.reload();
				window.close(); */
				
				
			}
			/* opener: 부모창, reload: 갱신 */
		</script>
    </head>
	<body>
	<div id="layoutSidenav_content">
	<main>
	<div class="container-fluid px-4">
	<h1 class="mt-4">상품 이미지 등록</h1>
	<form  enctype="multipart/form-data" name="Writeform">
		상품코드 : <input type="text" name="p_code" value="${p_code}" style="border:none" readonly><br>
		<p>업로드할 이미지를 선택해 주세요
		<input type="file" name="p_img" class="form-control"></p>
		<input type="button" value="저장" style="float:right" class="btn btn-primary btn-sm" onclick="winclose();">
		
	</form>
<!-- 	<a href="javascript:winclose()" class="btn btn-dark btn-sm" style="float:right">닫기</a> -->
	</div>
	</main>
	</div>
	</body>
</html>