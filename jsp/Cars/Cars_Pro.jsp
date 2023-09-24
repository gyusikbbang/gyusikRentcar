<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
    <%@ page import = "rent.cars.carDBBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("utf-8");%>

<%
  String realFolder = "";//웹 어플리케이션상의 절대 경로
  String img ="";
  MultipartRequest imageUp = null; 

  String saveFolder = "/imageFile";//파일이 업로드되는 폴더를 지정한다.
  String encType = "utf-8"; //엔코딩타입
  int maxSize = 2*1024*1024;  //최대 업로될 파일크기 5Mb
  //현재 jsp페이지의 웹 어플리케이션상의 절대 경로를 구한다
  ServletContext context = getServletContext();
  realFolder = context.getRealPath(saveFolder);  

  try{
     //전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
     //전송할 파일명을 가지고 있는 객체, 서버상의 절대경로,최대 업로드될 파일크기, 문자코드, 기본 보안 적용
     imageUp = new MultipartRequest(
		 request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
   
     //전송한 파일 정보를 가져와 출력한다
     Enumeration<?> files = imageUp.getFileNames();
   
     //파일 정보가 있다면
     while(files.hasMoreElements()){
       //input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
       String name = (String)files.nextElement();
   
       //서버에 저장된 파일 이름
       img = imageUp.getFilesystemName(name);
     }
  }catch(Exception e){
     e.printStackTrace();
  }
%>

<jsp:useBean id="car" scope="page" 
       class="rent.cars.carDataBean">
</jsp:useBean>

<%

   String car_id = imageUp.getParameter("car_id");
   String com_id = imageUp.getParameter("com_id");
   String car_name = imageUp.getParameter("car_name");
   String car_type = imageUp.getParameter("car_type");
   String car_number = imageUp.getParameter("car_number");
   String reg_date = imageUp.getParameter("reg_date");
   String nop = imageUp.getParameter("nop");
   String car_info = imageUp.getParameter("car_info");
   String car_repair = imageUp.getParameter("car_repair");
   String rent_num = imageUp.getParameter("rent_num");
   String car_rent_price = imageUp.getParameter("car_rent_price");


   String id = request.getParameter("id");
   String passwd= request.getParameter("passwd");
   String name = request.getParameter("name");    
   

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
   try{
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "bban";
	String password = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
		  conn = DriverManager.getConnection(url, user, password);
 	
 	 String sql= "insert into cars (car_id,com_id,car_name,car_type,car_number,reg_date,nop,car_info,car_rent_price,car_repair,rent_num,img) values (?,?,?,?,?,?,?,?,?,?,?,?)";
 	 pstmt=conn.prepareStatement(sql);
 	  pstmt.setString(1,car_id);
      pstmt.setString(2,com_id);
 	  pstmt.setString(3,car_name);
	  pstmt.setString(4,car_type);
	  pstmt.setString(5,car_number);
	  pstmt.setString(6,reg_date);
	  pstmt.setString(7,nop);
     pstmt.setString(8,car_info);
 	  pstmt.setString(9,car_rent_price);
	   pstmt.setString(10,car_repair);
	   pstmt.setString(11,rent_num);
	  pstmt.setString(12,img);

 	 pstmt.executeUpdate();
 	 
 	 str= "테이블에 새로운 레코드를 추가했습니다.";

 	}catch(Exception e){ 
 		e.printStackTrace();
 		str="member 테이블에 새로운 레코드를 추가에 실패했습니다";
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
	  <script>
		setTimeout(function(){
			location.href = 'Cars_Select.jsp';
		}, 1000);
	  </script>
	</body>
	</html>































