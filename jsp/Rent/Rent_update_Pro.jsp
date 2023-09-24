<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("utf-8"); %>

<%
   String car_rent_id = request.getParameter("car_rent_id");
  String car_id = request.getParameter("car_id");
  String cus_driver_license_id = request.getParameter("cus_driver_license_id");
  String rent_start_date = request.getParameter("rent_start_date");
  String rent_end_date = request.getParameter("rent_end_date");
  String rent_period = request.getParameter("rent_period");
  String price = request.getParameter("price");
  String add_price = request.getParameter("add_price");
  String add_contents = request.getParameter("add_contents");

  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "bban";
	String password = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
		  conn = DriverManager.getConnection(url, user, password);
	
	String sql= "update rent set car_rent_id =?, car_id= ?, cus_driver_license_id= ?, rent_start_date= ?, rent_end_date= ?, rent_period = ?, price= ? , add_price= ?  , add_contents= ?  where car_rent_id= ?";
	pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,car_rent_id);
	pstmt.setString(2,car_id);
	pstmt.setString(3,cus_driver_license_id);
	pstmt.setString(4,rent_start_date);
	pstmt.setString(5,rent_end_date);
	pstmt.setString(6,rent_period);
	pstmt.setString(7,price);
	pstmt.setString(8,add_price);
	pstmt.setString(9,add_contents);
	pstmt.setString(10,car_rent_id);
	


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
		location.href = 'Rent_Select.jsp';
	}, 1000);
  </script>
</body>
</html>
