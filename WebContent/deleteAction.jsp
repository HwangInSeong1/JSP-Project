<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvr.MvrDAO" %>
<%@ page import="mvr.Mvr" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<title>writeAction</title>
</head>
<body>
	<%
		String user_ID = null;
		if(session.getAttribute("user_ID") != null) {
			user_ID = (String) session.getAttribute("user_ID");
		}
		if(user_ID == null) {
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int R_NUM = 0;
	    if(request.getParameter("R_NUM") != null) {
	    	R_NUM = Integer.parseInt(request.getParameter("R_NUM"));
	    	}
	    if(R_NUM == 0) {
	    	PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'Review.jsp'");
			script.println("</script>");
	    }
	    Mvr mvr = new MvrDAO().getMvr(R_NUM);
	    if(!user_ID.equals(mvr.getUser_ID())){
	    	PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'Review.jsp'");
			script.println("</script>");
		} else {
				MvrDAO mvrDAO = new MvrDAO();
				int result = mvrDAO.delete(R_NUM);
				if(result == -1) {
					PrintWriter script =response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");;
				}
				else  {
					PrintWriter script =response.getWriter();
					script.println("<script>");
					script.println("alert('삭제 완료.')");
					script.println("location.href = 'Review.jsp'");
					script.println("</script>");
				}
		}
	%>
</body>
</html>