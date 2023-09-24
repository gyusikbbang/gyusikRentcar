<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "rent.com.comDBBean" %>
<%@ page import = "rent.com.comDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
	List<comDataBean> articleList = null; 
    
		comDBBean dbPro = comDBBean.getInstance();
		count = dbPro.getArticleCount();
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize);
    }

	number = count-(currentPage-1)*pageSize;
%>

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
			background-color: #0487d9;
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
    		top: 105px;
    		left: 440px;
            font-weight: bold;
			width: 150px;

		}.button2 {
			background-color: #d34fe4;
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
    		top: 105px;
    		left: 480px;
            font-weight: bold;
		}

        table {
            width: 1200px;
            text-align: center;
            border: 1px solid #fff;
            border-spacing: 1px;
            font-family: 'Cairo', sans-serif;
          margin: auto;
		  margin-top: 30px;
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
			top: 75px;
    		left: 1350px;
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
			position: fixed;
			top: 375px;
    		left: 10px;

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
		.cc{
			display: flex;
			flex-flow: row nowrap;
			justify-content: center;
		
		}
		.pagination{
			margin-top: 7px;
			display: flex;
			flex-flow: row nowrap;
			justify-content: center;

		}



    </style>
    </head>
	<body>


		<div calss="nav-var">
			<ul>
				<li><a class="active" href="/book/jsp/main.jsp">Home</a></li>
				<li><a href="/book/jsp/Rent_com/Rent_com_Select.jsp">Company</a></li>
				<li><a href="/book/jsp/Cars/Cars_Select.jsp">Cars</a></li>
				<li><a href="/book/jsp/Rent/Rent_Select.jsp">Rent</a></li>
				<li><a href="/book/jsp/Rent_customer/Rent_customer_Select.jsp">Customer</a></li>
				<li><a href="/book/jsp/Repair_shop/Repair_shop_Select.jsp">Repair Shop</a></li>
				<li><a href="/book/jsp/Repair_inform/Repair_inform_Select.jsp">Repair Info</a></li>
				<div style="float:right;" role="group" aria-label="Basic radio toggle button group">
					<span style="color: #ffffff;"><%=id %></span>
						<form method="post" action="sessionLogout.jsp">
						<input type="submit" value="로그아웃">
						</form>
			</div>
			</ul>	
		<table>
			<button type="button" class="button1" onclick="location.href='Rent_com_search.jsp'">회사명 검색</button>
			<caption><br></caption>
			<caption><a style="float:left; font-size: 1.5em;" >캠핑카 대여회사(총 <%=count%>)</a></caption>
			<caption><br></caption>
			<thead>
				<tr class="table-success">
					<th>회사ID</th>
					<th>회사명</th>
					<th>회사 주소</th>
					<th>회사 전화번호</th>
					<th>회사 담당자</th>
					<th>회사 담당자 이메일</th>
					
					

				 </tr>
					</thead>
					<tbody>
						<% if (count == 0) { %>

							<table>
							<tr>
								<td align="center">
										  게시판에 저장된 글이 없습니다.
								</td>
							</table>
							
							<% } 
							else {
							%>
							
							
							<%  
							for (int i = 0 ; i < articleList.size() ; i++) {
								comDataBean article = articleList.get(i);
						 %>
							<tr height="30">
							 <td  width="50" > <%=article.getComid()%></td>
							 <td><%=article.getComName()%></a></td>
							 <td><%=article.getComAddr()%></a></td>
							 <td><%=article.getComtel()%></a></td>
							 <td><%=article.getComManager()%></a></td>
							 <td><%=article.getComManaEmail()%></a></td>
						 
							 
						 
									
							  
								   
						 
							 
											  
						   
						   </tr>
							<%}%>
							</table>
							<%}%>
							<%}%>
							<div class="text-center">
								<nav class="cc">
									<ul class="pagination">
								<%
									if (count > 0) {
										int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
										int startPage =1;
										
										if(currentPage % 10 != 0)
										startPage = (int)(currentPage/10)*10 + 1;
										else
										startPage = ((int)(currentPage/10)-1)*10 + 1;
							
										int pageBlock = 10;
										int endPage = startPage + pageBlock - 1;
										if (endPage > pageCount) endPage = pageCount;
								%>
										<li class="page-item">
										<a class="page-link<% if(startPage < 10) out.print(" disabled"); %>" href="Rent_Select.jsp?pageNum=<%= startPage - 10 %>" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
										</li>
								<% 
									for (int i = startPage; i <= endPage; i++) { %>
										<li class="page-item<% if(i == currentPage) out.print(" active"); %>"><a class="page-link" href="Rent_com_Select.jsp?pageNum=<%= i %>"><%= i %></a></li>
								<%  } %>
										<li class="page-item">
											<a class="page-link<% if(endPage >= pageCount) out.print(" disabled"); %>" href="Rent_Select.jsp?pageNum=<%= startPage + 10 %>" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
								<%  } %>
									</ul>
								</nav>
							</div>
						
<tfoot>
	<td colspan="10" class="tablefoot"></td>
</tfoot>
</tbody>
</table>
</div>
</div>
</div>
</body>
	<div class="menu">
		<a>메뉴</a>
		<input type="checkbox" id="expand-menu" name="expand-menu">
		<ul>
			<li><a href="Rent_com_Form.jsp" class="item"><div>추가</div></a></li>
			<li><a href="Rent_com_update_Form.jsp" class="item"><div>수정</div></a></li>
			<li><a href="Rent_com_delete_Form.jsp" class="item"><div>삭제</div></a></li>
		</ul>
	</div>		
</html>
<% 
    }catch(Exception e){
		e.printStackTrace();
	}
%>




















































































































