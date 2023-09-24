<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.naming.*, java.sql.*, javax.sql.*"%>
<%@ page import="ch13.board.BoardDBBean" %>
<%@ page import="ch13.board.BoardDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
   String id ="";
   try{
	   id = (String)session.getAttribute("id");
	   if(id==null || id.equals(""))
           response.sendRedirect("login_main.jsp");
	   else{
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="select.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">		
	<style>
	
		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			background-color: #333;
		  }
		  
		  li {
			float: left;
		  }
		  
		  li a {
			display: block;
			color: white;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
		  }
		  
		  li a:hover:not(.active) {
			background-color: #111;
		  }
		  
		  .active {
			background-color: #04AA6D;
		  }
		
		.button {
			background-color: #4CAF50; /* Green */
			border: none;
			color: white;
			padding: 10px 30px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 12px;
			margin: 4px 2px;
			cursor: pointer;
			border-radius: 5px;
			position: absolute; 
    		top: 125px;
    		left: 360px;
            font-weight: bold;
		}.button1 {
			background-color: #0487d9; /* Green */
			border: none;
			color: white;
			padding: 10px 30px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 12px;
			margin: 4px 2px;
			cursor: pointer;
			border-radius: 5px;
			position: absolute; 
    		top: 125px;
    		left: 450px;
            font-weight: bold;
		}.button2 {
			background-color: #e02525; /* Green */
			border: none;
			color: white;
			padding: 10px 30px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 12px;
			margin: 4px 2px;
			cursor: pointer;
			border-radius: 5px;
			position: absolute; 
    		top: 125px;
    		left: 540px;
            font-weight: bold;
		}

        table {
            width: 1200px;
            text-align: center;
            border: 1px solid #fff;
            border-spacing: 1px;
            font-family: 'Cairo', sans-serif;
          margin: auto;
		  margin-top: 110px;
        }
        
        caption {
            font-weight: bold;
        }
        
        table td {
            padding: 10px;
            background-color: #eee;
        }
        
        table th {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }
        
        img {
            width: 90px;
            height: 90px;
        }
        
        .view,
		.update,
        .delete {
            border: none;
            padding: 5px 10px;
            color: #fff;
            font-weight: bold;
        }
        

        .update {
            background-color: #03A9F4;
			border-radius: 5px;
        }
        
        .delete {
            background-color: #E91E63;
			border-radius: 5px;
        }
        
        .tablefoot {
            padding: 0;
            border-bottom: 3px solid #009688;
        }

		  
		.search-box {
			position: absolute;
			top: 187px;
    		left: 480px;
			border-radius: 40px;
			transform: translate(-50%, -50%);
		}

		.menu ::before{
			font-family: 'Material Icons';
			font-size: 1.5em;
			float: left;
			clear: left;
		}
		.menu label::before{ content: '\e5d2'; }
.menu li:nth-child(1) a::before{ content: '\f02e'; }
.menu li:nth-child(2) a::before{ content: '\e8d6'; }
.menu li:nth-child(3) a::before{ content: '\e88a'; }
.menu li:nth-child(4) a::before{ content: '\e8cc'; }
.menu li:nth-child(5) a::before{ content: '\e87d'; }
.menu li:nth-child(6) a::before{ content: '\e8b8'; }

		#expand-menu { /* 체크박스 폼 요소 감춤 */
			display: none;
		}
		#expand-menu:checked ~ ul { /* 체크박스 체크되었으면 메뉴 목록 표시 - 반응형 표시용 */
			display: block;
			height: auto;
		}

		.menu {
			display: block;
			width: 150px;
			background-color: #333;
			color: #fff;
			border-radius: 20px;
			padding: 10px;
			box-sizing: border-box;
			overflow: hidden; /* 반응형 애니메이션용 */
			transition: all 0.5s ease; /* 반응형 애니메이션 */
		}
		.menu ul {
			list-style: none;
			margin: 0;
			padding: 0;
		}
		.menu a, .menu > label {
			display: block;
			height: 25px;
			padding: 8px;
			cursor: pointer;
			color: #fff;
			text-decoration: none;
		}

		.menu a:hover {
			color: rgb(255, 255, 255);
			width: 120px;
		}
		.menu ul li:hover, .menu > label:hover {
			background-color: #fff;
			color: #000;
			border-radius: 10px;
		}
		.menu div {
			line-height: 1.5;
			font-size: 1em;
			font-family: 'Noto Sans KR';
			padding: 0 0 0 50px; /* 아이콘과 텍스트 사이 여백 */
		}
		@import url('https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400');

body, html {
  font-family: 'Source Sans Pro', sans-serif;
  padding: 0;
  margin: 0;
}

#particles-js {
  position: absolute;
  width: 100%;
  height: 100%;
}

.container{
  margin: 0;
  top: 50px;
  left: 50%;
  position: absolute;
  text-align: center;
  transform: translateX(-50%);
  background-color: rgb( 33, 41, 66 );
  border-radius: 9px;
  border-top: 10px solid #79a6fe;
  border-bottom: 10px solid #8BD17C;
  width: 1400px;
  height: 680px;
  box-shadow: 1px 1px 108.8px 19.2px rgb(25,31,53);

}

.box h4 {
  font-family: 'Source Sans Pro', sans-serif;
  color: #5c6bc0; 
  font-size: 18px;
  margin-top:94px;;
}

.box h4 span {
  color: #dfdeee;
  font-weight: lighter;
}

.box h5 {
  font-family: 'Source Sans Pro', sans-serif;
  font-size: 13px;
  color: #a1a4ad;
  letter-spacing: 1.5px;
  margin-top: -15px;
  margin-bottom: 70px;
}

.box input[type = "text"],.box input[type = "password"] {
  display: block;
  margin: 20px auto;
  background: #262e49;
  border: 0;
  border-radius: 5px;
  padding: 14px 10px;
  width: 320px;
  outline: none;
  color: #d6d6d6;
      -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
    -ms-transition: all .2s ease-out;
    -o-transition: all .2s ease-out;
    transition: all .2s ease-out;
  
}
::-webkit-input-placeholder {
  color: #565f79;
}

.box input[type = "text"]:focus,.box input[type = "password"]:focus {
  border: 1px solid #79A6FE;
  
}

a{
  color: #5c7fda;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

 label input[type = "checkbox"] {
  display: none; /* hide the default checkbox */
}

/* style the artificial checkbox */
label span {
  height: 13px;
  width: 13px;
  border: 2px solid #464d64;
  border-radius: 2px;
  display: inline-block;
  position: relative;
  cursor: pointer;
  float: left;
  left: 7.5%;
}

.btn1 {
  border:0;
  background: #7f5feb;
  color: #dfdeee;
  border-radius: 100px;
  width: 340px;
  height: 49px;
  font-size: 16px;
  position: absolute;
  top: 79%;
  left: 8%;
  transition: 0.3s;
  cursor: pointer;
}

.btn1:hover {
  background: #5d33e6;
}

.rmb {
  position: absolute;
  margin-left: -24%;
  margin-top: 0px;
  color: #dfdeee;
  font-size: 13px;
}

.forgetpass {
  position: relative;
  float: right;
  right: 28px;
}

.dnthave{
    position: absolute;
    top: 92%;
    left: 24%;
}

[type=checkbox]:checked + span:before {/* <-- style its checked state */
    font-family: FontAwesome;
    font-size: 16px;
    content: "\f00c";
    position: absolute;
    top: -4px;
    color: #896cec;
    left: -1px;
    width: 13px;
}

.typcn {
  position: absolute;
  left: 339px;
  top: 282px;
  color: #3b476b;
  font-size: 22px;
  cursor: pointer;
}      

.typcn.active {
  color: #7f60eb;
}

.error {
  background: #ff3333;
  text-align: center;
  width: 337px;
  height: 20px;
  padding: 2px;
  border: 0;
  border-radius: 5px;
  margin: 10px auto 10px;
  position: absolute;
  top: 31%;
  left: 7.2%;
  color: white;
  display: none;
}

.footer {
    position: relative;
    left: 0;
    bottom: 0;
    top: 605px;
    width: 100%;
    color: #78797d;
    font-size: 14px;
    text-align: center;
}

.footer .fa {
  color: #7f5feb;;
}

    </style>
	<script type="text/javascript">	
		function searchCheck(){
		 var form = document.searchForm;
		 if (form.word.value == '' || form.word.value == null){
		  alert('검색어를 입력하세요.');
		  form.word.focus();
		  return false;
		 } else {
		  form.submit;
		 }
		}
	   </script>
    </head>		
		<body id="particles-js"></body>
		<div class="animated bounceInDown">
		  <div class="container">
			<span class="error animated tada" id="msg"></span>
			<table>
				<caption><a style="float:left; font-size: 1.5em;" >고객 청구금액</a></caption>
				<caption><br></caption>
				<thead>
					<tr>
						<th>운전면허증ID</th>
						<th>이름</th>
						<th>주소</th>
						<th>이메일</th>
						<th>이용일수</th>
						<th>이용캠핑카 타입</th>
						<th>합계(원)</th>
					</tr>
				</thead>
				<tbody>
					<%
						Connection conn=null;
						PreparedStatement pstmt=null;
						ResultSet rs=null;
					  
						String word = request.getParameter("word");
						try{
						  
						  String url = "jdbc:oracle:thin:@localhost:1521:xe";
						  String user = "bban";
						  String password = "1234";
						  
						  Class.forName("oracle.jdbc.driver.OracleDriver");
								conn = DriverManager.getConnection(url, user, password);
					      


						  Context initCtx = new InitialContext();
						  Context envCtx = (Context) initCtx.lookup("java:comp/env");
						  DataSource ds = (DataSource)envCtx.lookup("jdbc/book");
						  conn = ds.getConnection();


						  
				String sql= "select c.cus_driver_license_id 운전면허증ID, c.cus_name 이름, c.cus_addr 주소, c.cus_email 이메일, c.use_num 이용일수, c.used_car_type 이용캠핑카타입, sum(r.price+r.add_price) 합계 from rent r, rent_customer c where r.cus_driver_license_id=c.cus_driver_license_id ";
				
				if(!"".equals(word)){
					word = "%" + word + "%";
					sql += " and c.cus_name like ? " ;					
				}

				sql += "group by c.cus_driver_license_id, c.cus_name , c.cus_addr , c.cus_email, c.use_num , c.used_car_type";

				pstmt=conn.prepareStatement(sql);

				if(!"".equals(word)){
					pstmt.setString(1, word);
				}
				rs=pstmt.executeQuery();
					
						   while(rs.next()){


						
							String 운전면허증ID= rs.getString("운전면허증ID");
							String 이름= rs.getString("이름");
							String 주소= rs.getString("주소");
							String 이메일= rs.getString("이메일");
							String 이용일수= rs.getString("이용일수");
							String 이용캠핑카타입= rs.getString("이용캠핑카타입");
							String 합계= rs.getString("합계");
					  %>
							 <tr>
							
								 <td><%=운전면허증ID%></td> 
								 <td><%=이름%></td>
								 <td><%=주소%></td>
								 <td><%=이메일%></td>
								 <td><%=이용일수%></td>
								 <td><%=이용캠핑카타입%></td>
								 <td><%=합계%></td>
								

								</tr>
								<%  } 
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
						
						<tfoot>
							<td colspan="10" class="tablefoot"></td>
						</tfoot>
				</tbody>
											</table>
											  </div> 
												   <div class="footer">
												   <br>
												   <br>
												   <br>
												   <br>
												   <br>
												   <br>
												   <br>
												   <br>
												   <br>
												   <br>
												  <span><a href="Rent_Select.jsp">돌아가기</a></span>
												</div>
											</div>
											<div class="search-box">
												<form action="" method="get">
													<input type="text" id="word" name="word"/>
													<input type="submit" value="검색" onclick="searchCheck()"/>
												</form>
											</div>
											
											
											</html>
					<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>