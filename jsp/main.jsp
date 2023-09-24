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
           response.sendRedirect("/book/jsp/memeber/login_main.jsp");
	   else{
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="select.css" rel="stylesheet" type="text/css">
    <style>
		body{

  			background-image: url("camp.png");
		}
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
			padding: 13px 30px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 12px;
			margin: 4px 2px;
			cursor: pointer;
			border-radius: 5px;
			position: absolute; 
    		top: 91px;
    		left: 460px;
            font-weight: bold;
		}

        table {
            width: 1000px;
            text-align: center;
            border: 1px solid #fff;
            border-spacing: 1px;
            font-family: 'Cairo', sans-serif;
          margin: auto;
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

		.nav-bar{
			position: fixed;
			width: 200px;

		}

		.search {
			position: absolute;
			width: 300px;
			top: 120px;
    		left: 860px;
		  }
		.search_btn{
			position:absolute;
			width: 70px;
			top: 0px;
    		left: 305px;
		}
		 
    </style>
    </head>
	<body>
		<div calss="nav-var">
			<ul>
				<li><a class="active" href="main.jsp">Home</a></li>
				<li><a href="Rent_com_Select.jsp">Company</a></li>
				<li><a href="Cars_Select.jsp">Cars</a></li>
				<li><a href="Rent_Select.jsp">Rent</a></li>
				<li><a href="Rent_customer_Select.jsp">Customer</a></li>
				<li><a href="Repair_shop_Select.jsp">Repair Shop</a></li>
				<li><a href="Repair_inform_Select.jsp">Repair Info</a></li>
				<div style="float:right;" role="group" aria-label="Basic radio toggle button group">
					<span style="color: #ffffff;"><%=id %></span>
						<form method="post" action="sessionLogout.jsp">
						<input type="submit" value="로그아웃">
			</div>
			</ul>
			
</tbody>
</table>
</div>
</div>
</div>
</body>
<!-- <form class="search" method="post" action="Rent_com_search_Pro.jsp">
	<input type="text" style="float:right" name="com_name" placeholder="검색어 입력">
	<button type="submit" class="search_btn" onclick="location.href='Rent_com_search_Pro.jsp'">검색</button>
</form> -->
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>