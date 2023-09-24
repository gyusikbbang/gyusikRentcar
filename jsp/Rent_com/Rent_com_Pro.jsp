<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<% 
   String com_id = request.getParameter("com_id");
   String com_name = request.getParameter("com_name");
   String com_addr = request.getParameter("com_addr");
   String com_tel = request.getParameter("com_tel");
   String com_manager = request.getParameter("com_manager");
   String com_manager_email = request.getParameter("com_manager_email");
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
 	
 	 String sql= "insert into rent_company values (?,?,?,?,?,?)";
 	 pstmt=conn.prepareStatement(sql);
 	  pstmt.setString(1,com_id);
	  pstmt.setString(2,com_name);
	  pstmt.setString(3,com_addr);
	  pstmt.setString(4,com_tel);
	  pstmt.setString(5,com_manager);
	  pstmt.setString(6,com_manager_email);
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
		location.href = 'Rent_com_Select.jsp';
	}, 1000);
  </script>
</body>
</html>