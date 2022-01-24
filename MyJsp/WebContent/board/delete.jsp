<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
<%
	//update_end파일 복사해옴.
	
	request.setCharacterEncoding("UTF-8"); 
	//parameter를 받을 때는 한글이 깨지는것을 막기 위해 무조건 적어주자.
	String b_num = request.getParameter("b_num"); //readonly로 받은 것

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
		
		/* 현재 이 파트에서 가장 중요한 코드: query */
		query = "DELETE FROM tblboard WHERE b_num=? ";
		// ? 넘어온 값을 말함
		pstmt = conn.prepareStatement(query);//쿼리 객체 생성
		//?값 채워주기
		pstmt.setInt(1, Integer.parseInt(b_num));
		pstmt.executeUpdate(); //insert, update, delete의 경우 사용.

%>		
		<script>
			alert("삭제되었습니다.");
			location.href = "./list.jsp";
		</script>	
		
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