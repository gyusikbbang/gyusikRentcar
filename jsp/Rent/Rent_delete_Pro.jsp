<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%
   request.setCharacterEncoding("utf-8");

   String car_rent_id = request.getParameter("car_rent_id");

%>
<html>
<head>
<title>레코드 삭제</title>
</head>
<body>
<%

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try{
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "bban";
	String password = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
		  conn = DriverManager.getConnection(url, user, password);
	
	String sql= "delete from rent where car_rent_id= ?";
	pstmt = conn.prepareStatement(sql);

    pstmt.setString(1,car_rent_id);
	pstmt.executeUpdate();

	}catch(Exception e){ 
		e.printStackTrace();
	}finally{
		if(rs != null) 
			try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) 
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) 
			try{conn.close();}catch(SQLException sqle){}
 }

%>
		    테이블의 레코드를 삭제했습니다.
		<script>
			setTimeout(function(){
				location.href = 'Rent_Select.jsp';
			}, 1000);
		  </script>
 
</body>
</html>
