<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	out.print("<table border= '1'>");
	for (int i = 1; i < 10; i++) {
		out.print("<tr>");
		for (int j = 1; j < 10; j++) {
			out.print(i + " * " + j + " = " + i * j + "  ");
			out.print("<td>" + i + " * " + j + " = " + (i * j) + "</td>");
		}
	}
	out.print("</table>");
	%>
	다른 방법으로 table 만들기.

	<table border="1">
		<%
		for (int i = 1; i <= 9; i++) {
		%>
		<tr>
			<%
			for (int j = 1; j <= 9; j++) {
			%>
			<td><%=i%> * <%=j%> = <%=i * j%></td>
			<% } %>
			</tr>
			<% } %>		
	</table>
	

	<!-- 아래 두 문법은 동일한 결과를 나타낸다. -->
	<%
	out.print("<font size='10'>");
	out.print("웹 프로그래밍 <br>");
	out.print("</font><br>");
	%>
	<font size="10"><%="웹 프로그래밍"%></font>
	<br>
	<!-- 위에 코드처럼 자바문법을 그대로 사용하는것은 비효율적이기 때문에 
	디자인 중심으로 만들도록 요구하는 jsp파일은 아래코드처럼 html 문법에 out.print
	단축키를 이용해서 사용한다. -->

</body>
</html>