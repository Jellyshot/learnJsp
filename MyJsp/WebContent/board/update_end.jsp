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
	String b_num = request.getParameter("b_num"); //readonly로 받은 것
	String b_subject = request.getParameter("b_subject"); 
	//write.jps의 name과 getParameter의 속성값이 같아야 함
	String b_name = request.getParameter("b_name");
	String b_contents = request.getParameter("b_contents");
out.print(b_subject);
	
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
		query = "update tblboard set b_subject=?, b_name=?, b_contents=? WHERE b_num=? ";
		// ? 넘어온 값을 말함
		pstmt = conn.prepareStatement(query);//쿼리 객체 생성
		//?값 채워주기
		pstmt.setString(1, b_subject);
		pstmt.setString(2, b_name);
		pstmt.setString(3, b_contents);
		pstmt.setInt(4, Integer.parseInt(b_num));
		pstmt.executeUpdate(); //insert, update, delete의 경우 사용.
		
		//페이지 이동시 화면에 메세지 출력을 해야 할 경우 javascript 사용, 이동만 할 경우 jsp코드 사용
		//여기서는 javascript를 사용함
%>		
		<script>
			alert("수정되었습니다.");
			location.href = "./view.jsp?b_num=<%= b_num %>";
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