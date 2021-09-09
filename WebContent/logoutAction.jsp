<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>LogoutAction</title>
</head>
<body>
	<%
		session.invalidate();	
	%>
	<script>
		location.href = 'index.jsp';
	</script>
</body>
</html>