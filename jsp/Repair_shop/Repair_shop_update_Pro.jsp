<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("utf-8"); %>

<%
  String repair_shop_id = request.getParameter("repair_shop_id");
  String shop_name = request.getParameter("shop_name");
  String shop_addr = request.getParameter("shop_addr");
  String shop_tel = request.getParameter("shop_tel");
  String shop_manager = request.getParameter("shop_manager");
  String shop_manager_email = request.getParameter("shop_manager_email");

  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "bban";
	String password = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
		  conn = DriverManager.getConnection(url, user, password);
	String sql= "update repair_shop set repair_shop_id =?, shop_name= ?, shop_addr= ?, shop_tel= ?, shop_manager= ?, shop_manager_email= ? where repair_shop_id= ?";
	pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,repair_shop_id);
	pstmt.setString(2,shop_name);
	pstmt.setString(3,shop_addr);
	pstmt.setString(4,shop_tel);
	pstmt.setString(5,shop_manager);
	pstmt.setString(6,shop_manager_email);
	pstmt.setString(7,repair_shop_id);


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
<html>
<head>
<title>레코드 수정</title>
</head>
<body>
  테이블의 레코드를 수정했습니다.
  <script>
	setTimeout(function(){
		location.href = 'Repair_shop_Select.jsp';
	}, 1000);
  </script>
</body>
</html>
