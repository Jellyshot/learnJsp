<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>myTest</title>
</head>
<body>
<h1> 	Hello JSPL๐ฐ๐ง๐ญ~! </h1>


<h2>๋ณ์ ์ฒ๋ฆฌํ๊ธฐ</h2>
	<c:set var="mynum" value="100"/>  <!-- set: ๋ณ์ ์ ์ธ! ํด๋ก์งํ๊ทธ๋ฅผ input์ฒ๋ผ ์ฌ์ฉํ  ์ ์์! -->
	 
	<h3><c:out value="${mynum}"/></h3> <!-- out: ์ถ๋ ฅํ๊ธฐ 1๋ฒ๋ฐฉ๋ฒ -->
	<h3>${mynum}</h3> <!-- ์ถ๋ ฅํ๊ธฐ 2๋ฒ๋ฐฉ๋ฒ -->
	
<h2>์ ์ด๊ตฌ์กฐ</h2>
	<c:choose> 
	<%-- choose์์๋ when๊ณผ otherwise๋ฅผ ์ฌ์ฉํ  ์ ์์! --%>
		<c:when test="${mynum % 2 == 0}"> 
		<!-- ์ฐ์ฐ์ test์์์ ๋๋ด์ฃ ์ผํฉ๋๋ค.  -->
			<h3>${mynum}์ ์ง์</h3>	
		</c:when>
		<c:otherwise>
			<h3>${mynum}์ ํ์</h3>
		</c:otherwise>
	</c:choose>  
	<%-- ํ ๋ผ์ธ์์ ๋๋  ์ ์์ ๋์๋ ํด๋ก์ง ํ๊ทธ๋ฅผ ๊ผญ๊ผญ ๋ซ์์ค์ผ ํฉ๋๋น --%>
	
<h3>๊ตฌ๊ตฌ๋จ</h3>
	<c:forEach var="i" begin="1" end="9">
		<c:forEach var="j" begin="1" end="9">
			${i}*${j}=${i*j}&nbsp;
		</c:forEach>
			<br> 
	</c:forEach>

</body>
</html>

