<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>myTest</title>
</head>
<body>
<h1> 	Hello JSPL🍰🍧🍭~! </h1>


<h2>변수 처리하기</h2>
	<c:set var="mynum" value="100"/>  <!-- set: 변수 선언! 클로징태그를 input처럼 사용할 수 있음! -->
	 
	<h3><c:out value="${mynum}"/></h3> <!-- out: 출력하기 1번방법 -->
	<h3>${mynum}</h3> <!-- 출력하기 2번방법 -->
	
<h2>제어구조</h2>
	<c:choose> 
	<%-- choose에서는 when과 otherwise를 사용할 수 있음! --%>
		<c:when test="${mynum % 2 == 0}"> 
		<!-- 연산은 test안에서 끝내죠야합니다.  -->
			<h3>${mynum}은 짝수</h3>	
		</c:when>
		<c:otherwise>
			<h3>${mynum}은 홀수</h3>
		</c:otherwise>
	</c:choose>  
	<%-- 한 라인에서 끝날 수 없을 때에는 클로징 태그를 꼭꼭 닫아줘야 합니당 --%>
	
<h3>구구단</h3>
	<c:forEach var="i" begin="1" end="9">
		<c:forEach var="j" begin="1" end="9">
			${i}*${j}=${i*j}&nbsp;
		</c:forEach>
			<br> 
	</c:forEach>

</body>
</html>

