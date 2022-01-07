<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="./Ex220104_4.jsp" method="post">
		성명 : <input type="text" name="sname" required><br>
		암호 : <input type="password" name="spwd" required><br>
		나이 : <input type="text" name="sage" required><br> 
		지역 : <select name="sarea">
			<option value="서울">서울</option>
			<option value="충북">충북</option>
			<option value="경기">경기</option>
			 </select><br>
		<!-- 2000년부터 2030년까지 syear변수로 전송할수 있는 select tag 구현하기 -->
		연도 : <select name="syear">
			<% 	
				for(int i=2000; i<=2030; i++){ %>
				<option value="<%= i %>"><%= i %></option>
			<% 	} %>
			<!--  option의 value 속성은 옵션이 선택될 때 서버로 제출되는 값을
			명시하며, 태그사이에 적는 텍스트는 단지 리스트에 표기되는 값일 뿐이다. -->
			 </select>
			 <br>
		취미 : <input type="radio" name="shoby" value="등산" checked>등산&nbsp;&nbsp;&nbsp;
			  <input type="radio" name="shoby" value="축구">축구&nbsp;&nbsp;&nbsp;
			  <input type="radio" name="shoby" value="여행">여행<br>
		  	<!-- radio의 경우, 최초값이 없기 때문에, 아무 선택이 되지 않고 데이터가 전송될 수 있으므로 
		  	초기값을 정해주기 위해, 태그 안에 checked를 적어준다. -->
		<input type="submit" value="전송">
	</form>
</body>