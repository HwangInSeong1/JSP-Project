<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fvr.FvrDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="fvr" class="fvr.Fvr" scope="page" />
<jsp:setProperty name="fvr" property="f_Title" />  <%-- property 앞글자 대문자면 DB 오류 --%>
<jsp:setProperty name="fvr" property="f_Content" />
<html>
<head>
<title>freewriteAction</title>
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
		} else {
	
			if(fvr.getF_Title() == null || fvr.getF_Content() == null) {
				PrintWriter script =response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				FvrDAO fvrDAO = new FvrDAO();
				int result = fvrDAO.write(fvr.getF_Title(),user_ID,fvr.getF_Content());
				if(result == -1) {
					PrintWriter script =response.getWriter();
					script.println("<script>");
					script.println("alert('글 작성에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");;
				}
				else  {
					PrintWriter script =response.getWriter();
					script.println("<script>");
					script.println("alert('작성 완료.')");
					script.println("location.href = 'free.jsp'");
					script.println("</script>");
				}
		}
	}	
	%>
</body>
</html>