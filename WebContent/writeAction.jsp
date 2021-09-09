<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvr.MvrDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mvr" class="mvr.Mvr" scope="page" />
<jsp:setProperty name="mvr" property="r_Title" />  <%-- property 앞글자 대문자면 DB 오류 --%>
<jsp:setProperty name="mvr" property="r_Content" />
<jsp:setProperty name="mvr" property="m_Name" />
<jsp:setProperty name="mvr" property="m_Score" />
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
		} else {
	
			if(mvr.getR_Title() == null || mvr.getR_Content() == null) {
				PrintWriter script =response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				MvrDAO mvrDAO = new MvrDAO();
				int result = mvrDAO.write(mvr.getR_Title(),user_ID,mvr.getR_Content(),
						mvr.getM_Name(),mvr.getM_Score());
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
					script.println("location.href = 'Review.jsp'");
					script.println("</script>");
				}
		}
	}	
	%>
</body>
</html>