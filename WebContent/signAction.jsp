<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="user_ID" />
<jsp:setProperty name="user" property="user_PW" />
<jsp:setProperty name="user" property="user_NAME" />
<jsp:setProperty name="user" property="user_BIRTH" />
<jsp:setProperty name="user" property="user_EMAIL" />
<jsp:setProperty name="user" property="user_PHONE" />
<jsp:setProperty name="user" property="user_GENDER" />
<html>
<head>
<title>signAction</title>
</head>
<body>
	<%
		if (user.getUser_ID() == null || user.getUser_PW() == null || user.getUser_NAME() == null
			|| user.getUser_BIRTH() == null || user.getUser_EMAIL() == null || user.getUser_PHONE() == null
			|| user.getUser_GENDER() == null) {
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
			UserDAO userDAO =new UserDAO();
			int result =userDAO.join(user);
			if(result == -1) {
				PrintWriter script =response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");;
			}
			else if( result == 0) {
				PrintWriter script =response.getWriter();
				script.println("<script>");
				script.println("alert('환영합니다.')");
				script.println("location.href = 'login.jsp'");
				script.println("</script>");
			}
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('환영합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>