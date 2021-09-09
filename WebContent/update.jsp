<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="mvr.MvrDAO" %>
<%@ page import="mvr.Mvr" %>    
<html>
    <head>
        <meta charset="UTF-8">
        <title>
            리뷰001
        </title>
        <style>
            strong {font-size:30px;text-shadow:2px 2px 2px gray;}
            th {border:1px solid black;}
            b {font-size:30px;text-shadow:2px 2px 2px gray;}
            tr:nth-child(1) {
            	background-color: transparent !important;
            	text-align: right;
            }
            tr:nth-child(2) {
                background-color:black;
                color:white;
            }
            a {
                color:black;
                text-decoration: none;
            }
            a:hover {
                color:blueviolet;
            }
            .a1 {
                color:red;
                text-decoration: none;
            }
            .a1:hover {
                color:blueviolet;
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
            input[type=text] {
            	width:450px;
                height:25px;
            }
            tr {
                background-color: white;
            }
        </style>
    </head>
    <body>
    	<%
    	String user_ID = null;
    	if(session.getAttribute("user_ID") != null) {
    		user_ID =(String) session.getAttribute("user_ID");
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
    	}
    	%>
        <div class=contain>
        <br><br>
        <b>영화 리뷰 작성하기</b>
        <br><br>
       <form method="post" action="updateAction.jsp?R_NUM=<%=R_NUM %>">
        <table style="margin-left:auto;margin-right:auto;">
        <tr>
        <th colspan=2><input type="text" name="r_Title" maxlength="50" value="<%= mvr.getR_Title() %>"></th>
        </tr>
        <tr>
        <th colspan=2><textarea name="r_Content" cols=61 rows=30><%= mvr.getR_Content() %></textarea></th>
        </tr>
        <tr>
       	 <th>영화제목</th>
       	 <th><%= mvr.getM_Name() %>
        </th>
        </tr>
        <tr>
        <th>평점주기</th> 
        <th> <%= mvr.getM_Score() %> </th>
        </tr>
        <tr style="background-color: transparent !important;">
        <th colspan=2 style="border:0px solid white; text-align: right;"><input type="submit" value="수정하기">
        <a href="Review.jsp" target=if1><input type="button" value="돌아가기"></a>
        </th>
        </tr>
        </table>
        </form>
    </div>
    </body>
</html>