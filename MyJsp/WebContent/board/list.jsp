<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read</title>
</head>
<body>
	<h3>게시판 리스트</h3>
	<a href="./write.jsp">글쓰기</a><br><br>
<%	
	/* 항상 이 3개의 객체는 전역변수로 선언해 놓아야 함. */
	Connection conn = null; //접속 객체를 null값으로 생성 선언
	PreparedStatement pstmt = null; //쿼리 객체 선언
	ResultSet rs = null; //쿼리 결과를 가져오는 객체 선언
	String query = ""; //sql 문법 선언
	
	try{
		Class.forName("com.mysql.jdbc.Driver"); /* 드라이버를 로드함 */
		//out.print("드라이버 로드 성공"); 로드 성공 후 주석처리함
		String url = "jdbc:mysql://localhost:3306/mysql";
		//접속 url로 mysql dbname은 변경될 수 있다.
		String user = "root"; //root라는 유저가
		String passwd = ""; // 다음과 같은 비밀번호로
		conn = DriverManager.getConnection(url, user, passwd);
		//연결(접속)한다.
		//out.print(conn + "<br>"); 연결성공 확인 후 주석처리함
		
		query = "select * from tblboard";
		pstmt = conn.prepareStatement(query);//쿼리 객체 생성
		rs = pstmt.executeQuery(); //쿼리를 실행하여 결과를 rs에 받음 
		/* rs객체는 여러개의 레코드가 포함되어 있을 수 있음(반복구문 필요) */
%>
		<!-- 결과값을 표로 나타내기 위해 jsp문을 끊어줌 
			반복구문을 통해 나오는 값들을 테이블로 만들것이기 때문에, while 전에 table태그를 열어서 while이 종료된후 닫음-->
		<table border="1">		
		<tr>
			<td align = "center" width="100">글번호</td>
			<td align = "center" width="250">제목</td>
			<td align = "center" width="130">작성자</td>
			<td align = "center" width="150">작성일</td>
		</tr>
<%		
		while(rs.next()){ //next: 결과값을 받았으면 true, 아니면 flase를 반환하는 static method
			int b_num = rs.getInt("b_num");
			String b_subject = rs.getString("b_subject");
			String b_name = rs.getString("b_name");
			String b_date = rs.getString("b_date");
%>			
		<tr>
			<td align = "center"><%= b_num %></td>
			<td align = "center"><a href="./view.jsp?b_num=<%= b_num %>"><%= b_subject %></a></td>
			<!-- 고유값인 b_num을 ?로 가져와서 Get방식의 고유링크 만들기 "./view.jsp?b_num=<%= b_num %>"-->
			<td align = "center"><%= b_name %></td>
			<td align = "center"><%= b_date %></td>
		</tr>
<%		
	}
%>
		</table>
<%		
	}catch(Exception e){
		out.print(e);
	//finally : 리소스 반납하기	
	}finally{ //finally문에서도 예외처리를 해야 하므로 try-catch문을 작성
		try{
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)	
			conn.close();
		}catch(Exception ex){
			
		}
	}
%>	
</body>
</html>