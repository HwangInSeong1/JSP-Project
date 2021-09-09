<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="fvr.FvrDAO" %>
<%@ page import="fvr.Fvr" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>
            리뷰001
        </title>
        <style>
            strong {font-size:30px;text-shadow:2px 2px 2px gray;}
            th {border:1px solid black;}
            h1 {
           	font-size : 40pt;
           	text-shadow : 2px 2px 2px gray;
           	font-family: "Roboto", serif;
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
    	int F_NUM = 0;
    	if(request.getParameter("F_NUM") != null) {
    		F_NUM = Integer.parseInt(request.getParameter("F_NUM"));
    	}
    	if(F_NUM == 0) {
    		PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'free.jsp'");
			script.println("</script>");
    	}
    	Fvr fvr = new FvrDAO().getFvr(F_NUM);
    	%>
        <div class=contain>
        <br>
        <h1>글 보기</h1>
        <br>
       
        <table style="margin-left:auto;margin-right:auto;">
        <tr>
        <th style="width:100px;">글 제목</th>
        <th colspan=2 style="width:300px; text-align:left;"><%= fvr.getF_Title() %></th>
        </tr>
        <tr>
        <th>작성자</th>
        <th colspan=2 style="text-align:left;"><%= fvr.getUser_ID() %></th>
        </tr>
        <tr>
        <th>작성일자</th>
        <th colspan=2 style="text-align:left;"><%= fvr.getF_DATE().substring(0, 11) + fvr.getF_DATE().substring(11, 13) + "시" + fvr.getF_DATE().substring(14, 16) + "분" %></th>
      
        <tr>
        <th colspan=3 style="min-height:200px; text-align: left;"><%= fvr.getF_Content().replace(" ","&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></th>
        </tr>
        <tr style="background-color: transparent !important;">
        <th colspan=3 style="border:0px solid white; text-align: right;">
        <a href="free.jsp" target=if1><input type="button" value="목록"></a>
        
       <input type="button" value="수정">
       <input type="button" value="삭제">
      
        </th>
        </tr>
        </table>
    </div>
    </body>
</html>