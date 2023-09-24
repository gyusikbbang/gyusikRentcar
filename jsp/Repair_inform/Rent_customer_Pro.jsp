<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<% 
   String cus_driver_license_id = request.getParameter("cus_driver_license_id");
   String cus_name = request.getParameter("cus_name");
   String cus_addr = request.getParameter("cus_addr");
   String cus_email = request.getParameter("cus_email");
   String use_num = request.getParameter("use_num");
   String used_car_type = request.getParameter("used_car_type");
   String used_date = request.getParameter("used_date");
   
   Timestamp register=new Timestamp(System.currentTimeMillis());

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
   try{
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "bban";
	String password = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
		  conn = DriverManager.getConnection(url, user, password);
 	
 	 String sql= "insert into rent_customer values (?,?,?,?,?,?,?)";
 	 pstmt=conn.prepareStatement(sql);
 	  pstmt.setString(1,cus_driver_license_id);
	  pstmt.setString(2,cus_name);
	  pstmt.setString(3,cus_addr);
	  pstmt.setString(4,cus_email);
	  pstmt.setString(5,use_num);
	  pstmt.setString(6,used_car_type);
	  pstmt.setString(7,used_date);
 	 pstmt.executeUpdate();
 	 
 	 str= "테이블에 새로운 레코드를 추가했습니다.";

 	}catch(Exception e){ 
 		e.printStackTrace();
 		str="테이블에 새로운 레코드를 추가에 실패했습니다";
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>

<html>
<head>
<title>레코드 추가</title>
</head>
<body>
  <%=str %>
  <script>
	setTimeout(function(){
		location.href = 'Rent_customer_Select.jsp';
	}, 1000);
  </script>
</body>
</html>