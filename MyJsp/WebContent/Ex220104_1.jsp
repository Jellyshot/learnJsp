<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아 왜 안바뀌냐고요</title>
</head>
<body>
<%
	//자바문법 적용 영역. 줄바꿈은 웹의영역에서 되지 않기 때문에 println대신 print를 쓴다.
	out.print("안녕하세요<br>"); 
	out.print("웹프로그래밍 입니다" + "<br>");
	out.print("서버새로고침을 왜계속해야되냐!");
	out.print("<h1>JSP프로그래밍</h1>");
	int i;
	int total = 0;
	for (i = 1; i<=10; i++){
		total += i;
	} out.print("1~10까지의 합은 " + total + "<br>");
	
%>
</body>
</html>