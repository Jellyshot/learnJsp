<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create</title>
</head>
<body>
	<h3>글 입력</h3>
	<a href="./list.jsp">글목록</a><br><br>
	<form method="post" action="./write_end.jsp">
		제목 : <input type="text" name="b_subject" required><br>
		작성자 : <input type="text" name="b_name" required><br>
		내용 : <textarea cols="50" rows="10" name="b_contents" required></textarea><br> 
		<input type="submit"  value="글쓰기">
	</form>
	
</body>
</html>