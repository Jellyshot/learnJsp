<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); 
	//parameter를 받을 때는 한글이 깨지는것을 막기 위해 무조건 적어주자.
	String b_num = request.getParameter("b_num"); //Get방식에 의한 전송
%>	
	<h3>수정 페이지</h3>
	<a href="./list.jsp">리스트로 돌아가기</a>
	<a href="./view.jsp?b_num=<%=b_num%>">상세보기로 돌아가기</a><br><br>
	<!-- 링크에 페이지구분값 Get방식으로 가져오기: 기존 링크?값이름=<print> -->
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
		
		/* 현재 이 파트에서 가장 중요한 코드: query */
		query = "select * from tblboard where b_num = ?";
		// ? 넘어온 값을 말함
		pstmt = conn.prepareStatement(query);//쿼리 객체 생성
		//문자열은 casting이 되지 않음(기본 데이터 타입만 됨) 따라서 wrapping?을 해줘야함
		/*래퍼클래스(Wrapper class)
		 Byte, Short, Integer, Long, Float, Double, Character, Boolean
		 래퍼클래스는 따로 변수 선언 없이 스태틱메서드(parseInt)를 통해 변환한다.*/
		
		pstmt.setInt(1,Integer.parseInt(b_num));
		
		rs = pstmt.executeQuery(); 
		//쿼리를 실행하여 결과를 rs에 받아서 num값에 맞는 정보 하나만 이동시켜야함 
		/* rs객체는 여러개의 레코드가 포함되어 있을 수 있음*/
		rs.next(); //첫번째 레코드로 이동시키는 메서드
		/*한번 더 쓰면 두번째로 이동하지만, 현재는 한개의 값만 검출되었기 때문에 한번만 씀.
		  따라서 while 루프 또한 필요 없음.*/
		String b_subject = rs.getString("b_subject");
		String b_name = rs.getString("b_name");
		String b_contents = rs.getString("b_contents");
		String b_date = rs.getString("b_date");
%>		
		
		<form action="./update_end.jsp" method="post">
		<table border="1" style="border-collapse:collapse; margin:auto; width:80%">
		<tr>
			<td align = "center" width="10%">글번호</td>
			
			<!-- 글번호는 구분을 위해 input tag로 값을 받아 update form으로 넘기지만, 
			수정은 하지 못하게 해야하므로 값을 value값으로 넣어서 보여주고
			읽을수만 있는 속성인 readonly를 준다. -->
			<td align = "center" width="10%">
			<input type="text" name="b_num" value="<%= b_num %>" readonly></td>
			<td align = "center" width="15%">작성자</td>
			<td align = "center" width="15%">
			<input type="text" name="b_name" value="<%= b_name %>"></td>
			
			<!-- 작성일의 경우 수정할 필요가 없으므로 보여주기만 한다.
				 단, 이 경우 b_date값이 post로 넘어가지는 않는다.  -->
			<td align = "center" width="20%">작성일</td>
			<td align = "center" width="30%"><%= b_date %></td>
		</tr>
		<tr>
			<td align = "center" width="50">제목</td>
			<td align = "center" colspan="5">
			<input type="text" name="b_subject" value="<%= b_subject %>"></td>
		</tr>
		<tr>
			<td align = "center" width="50">내용</td>
			<td align = "center" colspan="5">
			<textarea name="b_contents" rows="10" style="width:95%"><%= b_contents %></textarea></td>
		</tr>
		<tr>
		<td align = "center" colspan="6">
			<input type="submit" value="[수정]" style= "margin:5px;">
			<a href="./delete.jsp?b_num=<%= b_num %>" style= "margin:5px;">[삭제]</a>
		</td>
		</tr>
		</table>
		</form>
<%		
	}catch(Exception e){
		out.print(e); //오류가 발생했을때, 페이지를 옮겨보리는 js코드를 삽입하는 곳.
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