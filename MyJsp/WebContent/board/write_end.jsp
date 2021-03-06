<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta charset: 화면에 표기되는 문자의 종류를 말함 -->
<title>Create</title>
</head>
<body>
	<!-- 1. 데이터를 작성해서 write로 넘겨야 하는것을 염두해 두어야 함. -->
	<!-- 2. 넘어오는 데이터는 모두 String으로 넘어와야 함. -->
	<!-- 3. 혼동을 피하기 위해 table의 col네임과 동일하게 작성함 -->
<%
	request.setCharacterEncoding("utf-8"); 
	//넘겨진 정보를 받을때의 문자종류를 지정해줌.
	String b_subject = request.getParameter("b_subject"); 
	//write.jps의 name과 getParameter의 속성값이 같아야 함
	String b_name = request.getParameter("b_name");
	String b_contents = request.getParameter("b_contents");
	
	out.print(b_subject + " : " + b_name +  " : "  + b_contents);
%>
<%	
	/* 항상 이 3개의 객체는 전역변수로 선언해 놓아야 함. 
	   sql객체이므로 page import 선언을 해주어야 한다 - 3 line 참고*/
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
		//여기까지는 항상 기본으로 가지고 와야함.
		
		query = "insert into tblboard (b_subject, b_name, b_contents) values(?,?,?)";
		// 쿼리는 목적에 따라 바뀜
		pstmt = conn.prepareStatement(query);//쿼리 객체 생성
		//쿼리 객체에 값 설정
		pstmt.setString(1, b_subject);
		pstmt.setString(2, b_name);
		pstmt.setString(3, b_contents);
		pstmt.executeUpdate(); 
		//list에서는 executequery를 사용했지만 insert, update, delete의 경우 executeUpdate를 사용.
		
		//페이지 이동시 화면에 메세지 출력을 해야 할 경우 javascript 사용, 이동만 할 경우 jsp코드 사용
		//여기서는 javascript를 사용함
%>		
		<script>
			alert("입력되었습니다.");
			location.href = "./list.jsp"
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