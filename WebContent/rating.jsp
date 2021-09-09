<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.DriverManager" %>
<%@page import= "java.sql.PreparedStatement" %>
<%@page import= "java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="mvr.MvrDAO" %>
<%@ page import="mvr.Mvr" %>

<html>
<head>
<title>영화순위</title>
<style>
	th {
		width : 100px;
		text-align: center;
		border:1px solid black;
		background-color: black;
		color: white;
	}
	 body {
                margin: 0;
                padding: 0;
                font-family: "Roboto", serif;
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
                overflow-x: hidden;  
            }
     .contain {
                width: 100%;
                height: 100%;
                position: relative;
                text-align: center;
                z-index:1;
            }
     .contain:after {
                background-image: url(img/back1.jpg);
                background-repeat: no-repeat;
                background-size:cover;
                position: absolute;
                top:0;
                left:0;
                opacity:0.7!important;
                z-index:-1;
                content:"";
                width: 100%;
                height: 100%;
            }
           h1 {
           	font-size : 40pt;
           	text-shadow : 2px 2px 2px gray;
           }
</style>
</head>
<body>
<div class="contain">
<br>
<h1 style="text-align:center"> 영 화 순 위</h1> <br>
	<% 
			request.setCharacterEncoding("UTF-8");
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/movie?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "1234";
			Connection conn = DriverManager.getConnection(dbURL,dbID,dbPW);
			String SQL = "select M_Name, round(avg(M_Score),2) as rating from mvrlist group by M_Name order by rating desc;";
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
	%>
	<%int i=1; %>
	<table style="margin-left:auto;margin-right:auto;">
	<tr>
	<th style="background-color:white;color:black;">순위</th> <th style="width:300px;background-color:white;color:black;">영화제목</th> <th style="background-color:white;color:black;">평점</th>
	</tr>
	<%while(rs.next()){
		%>
		<tr>
		<th><%out.println(i++); %></th> 
		<th><%=rs.getString("M_Name") %></th>
		<th><%=rs.getString("rating") %></th>
		</tr>
		<tr>
	<%} %>
	</table>
	</div>
</body>
</html>