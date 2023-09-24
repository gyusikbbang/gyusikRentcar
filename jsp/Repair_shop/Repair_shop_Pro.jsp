<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<% 
   String repair_shop_id = request.getParameter("repair_shop_id");
   String shop_name = request.getParameter("shop_name");
   String shop_addr = request.getParameter("shop_addr");
   String shop_tel = request.getParameter("shop_tel");
   String shop_manager = request.getParameter("shop_manager");
   String shop_manager_email = request.getParameter("shop_manager_email");
   
   String id = request.getParameter("id");
   String passwd= request.getParameter("passwd");
   String name = request.getParameter("name");    
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
 	
 	 String sql= "insert into repair_shop values (?,?,?,?,?,?)";
 	 pstmt=conn.prepareStatement(sql);
 	  pstmt.setString(1,repair_shop_id);
	  pstmt.setString(2,shop_name);
	  pstmt.setString(3,shop_addr);
	  pstmt.setString(4,shop_tel);
	  pstmt.setString(5,shop_manager);
	  pstmt.setString(6,shop_manager_email);
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
		location.href = 'Repair_shop_Select.jsp';
	}, 1000);
  </script>
</body>
</html>