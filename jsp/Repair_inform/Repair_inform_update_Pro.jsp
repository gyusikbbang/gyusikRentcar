<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("utf-8"); %>

<%
  String repair_number = request.getParameter("repair_number");
  String car_id = request.getParameter("car_id");
  String repair_shop_id = request.getParameter("repair_shop_id");
  String cus_driver_license_id = request.getParameter("cus_driver_license_id");
  String repair_contents = request.getParameter("repair_contents");
  String repair_date = request.getParameter("repair_date");
  String repair_price = request.getParameter("repair_price");
  String price_deadline = request.getParameter("price_deadline");
  String add_repair_contents = request.getParameter("add_repair_contents");
  String repair_end_date = request.getParameter("repair_end_date");


  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "bban";
    String password = "1234";
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection(url, user, password);
	String sql= "update repair_inform set repair_number =?, car_id= ?, repair_shop_id= ?, cus_driver_license_id= ?, repair_contents= ?, repair_date= ?, repair_price= ?, price_deadline= ?, add_repair_contents= ?, repair_end_date= ? where repair_number= ? and car_id= ?";
	pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,repair_number);
	pstmt.setString(2,car_id);
	pstmt.setString(3,repair_shop_id);
	pstmt.setString(4,cus_driver_license_id);
	pstmt.setString(5,repair_contents);
	pstmt.setString(6,repair_date);
	pstmt.setString(7,repair_price);
    pstmt.setString(8,price_deadline);
    pstmt.setString(9,add_repair_contents);
    pstmt.setString(10,repair_end_date);
    pstmt.setString(11,repair_number);
    pstmt.setString(12,car_id);

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
		location.href = 'Repair_inform_Select.jsp';
	}, 1000);
  </script>
</body>
</html>
