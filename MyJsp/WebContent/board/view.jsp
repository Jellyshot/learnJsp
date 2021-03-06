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
<%
	request.setCharacterEncoding("UTF-8"); 
	//parameter를 받을 때는 한글이 깨지는것을 막기 위해 무조건 적어주자.
	String b_num = request.getParameter("b_num"); //Get방식에 의한 전송
%>	
	<h3>상세보기</h3>
	<a href="./list.jsp">리스트로 돌아가기</a><br><br>
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
		
		query = "select * from tblboard where b_num = ?";
		// ? 넘어온 값을 말함
		pstmt = conn.prepareStatement(query);//쿼리 객체 생성
		//문자열은 casting이 되지 않음(기본 데이터 타입만 됨) 따라서 wrapping?을 해줘야함 
		
		pstmt.setInt(1,Integer.parseInt(b_num));
		
		rs = pstmt.executeQuery(); //쿼리를 실행하여 결과를 rs에 받아서 num값에 맞는 정보 하나만 이동시켜야함 
		/* rs객체는 여러개의 레코드가 포함되어 있을 수 있음*/
		rs.next(); //첫번째 레코드로 이동(레코드는 단 1개만 검색됨)
		String b_subject = rs.getString("b_subject");
		String b_name = rs.getString("b_name");
		String b_contents = rs.getString("b_contents");
		String b_date = rs.getString("b_date");
		/* 치환시키는 메서드를 사용하여, contents의 내용을 줄바꿈하도록 만들기 */
		/* 기본적으로 우리가 웹에서 enter를 치면 \n이 기록되어 있다. 
		html코드상에 줄바꿈은 br태그를 이용함으로 치환시킴*/
		/* textarea는 엔터를 쳐서 다음줄 넘김이 가능하지만, 다른 입력요소들은 그게 불가능하므로
		현재 view.jsp에서는 td안에 b_contents를 입력하므로, 엔터 입력을 <br>로 나타냄*/
		b_contents = b_contents.replace("\n", "<br>");

%>		
		
		<table border="1" style="border-collapse:collapse; margin:auto; width:80%">
		<tr>
			<td align = "center" width="10%">글번호</td>
			<td align = "center" width="10%"><%= b_num %></td>
			<td align = "center" width="15%">작성자</td>
			<td align = "center" width="15%"><%= b_name %></td>
			<td align = "center" width="20%">작성일</td>
			<td align = "center" width="30%"><%= b_date %></td>
		</tr>
		<tr>
			<td align = "center" width="50">제목</td>
			<td align = "center" colspan="5"><%= b_subject %></td>
		</tr>
		<tr>
			<td align = "center" width="50">내용</td>
			<td align = "center" colspan="5"><%= b_contents %></td>
		</tr>
		<tr>
		<td align = "center" colspan="6">
			<a href="./update.jsp?b_num=<%= b_num %>" style= "margin:5px;">[수정]</a>
			<a href="./delete.jsp?b_num=<%= b_num %>" style= "margin:5px;">[삭제]</a>
		</td>
		</tr>
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