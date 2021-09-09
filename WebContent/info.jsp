<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.DriverManager" %>
<%@page import= "java.sql.PreparedStatement" %>
<%@page import= "java.sql.ResultSet" %>
<html>
<head>
<title>회원정보</title>
<style>
	th {
		width : 100px;
		text-align: left;
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
</style>
</head>
<body>
<div class="contain">
<br><br><br>
<h1 style="text-align:center"> 회원정보 </h1> <br><br>
	<% 
			request.setCharacterEncoding("UTF-8");
			Class.forName("com.mysql.jdbc.Driver");
			String user_ID=(String)session.getAttribute("user_ID");
			String dbURL = "jdbc:mysql://localhost:3306/movie?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "1234";
			Connection conn = DriverManager.getConnection(dbURL,dbID,dbPW);
			String SQL = "select * from user where user_ID=? ";
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,user_ID);
			ResultSet rs = pstmt.executeQuery();
	%>
	<%while(rs.next()){
		%><table style="margin-left:auto;margin-right:auto;">
		<tr>
		<th>ID </th> <th style="width:300px;"><%=rs.getString("user_ID") %></th>
		</tr>
		<tr>
		<th>PW </th> <th><%=rs.getString("user_PW") %></th>
		</tr>
		<tr>
		<th>이름 </th> <th><%=rs.getString("user_NAME") %></th>
		</tr>
		<tr>
		<th>생일 </th> <th><%=rs.getString("user_BIRTH") %></th>
		</tr>
		<tr> 
		<th>폰번호 </th> <th><%=rs.getString("user_PHONE") %></th>
		</tr>
		<tr> 
		<th>이메일 </th> <th><%=rs.getString("user_EMAIL") %></th>
		</tr>
		<tr>
		<th>성별 </th> <th><%=rs.getString("user_GENDER") %></th>
		</tr>
	<%} %>
	</table>
	</div>
</body>
</html>