<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="fvr.FvrDAO" %>
<%@ page import="fvr.Fvr" %>
<%@ page import="java.util.ArrayList" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>
            free
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
                height:23px;
            }
            tr {
                background-color: white;
            }
            h1 {
           	font-size : 40pt;
           	text-shadow : 2px 2px 2px gray;
           	font-family: "Roboto", serif;
           }
           
        </style>
    </head>
    <body>
    <%
    	int pageNumber = 1;
    	if (request.getParameter("pageNumber") != null) {
    		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    	}
    %>
        <div class=contain>
        <br>
        	<h1>자유게시판</h1>
        <br>
        <table style="margin-left:auto;margin-right:auto;">
        <tr>
        <th colspan=4 style="border:0px solid white;"> <a href="freewrite.jsp" target=if1><input type=button value="작성하기"></a></th>
        </tr>
            <tr>
                <th style="width:100px">번 호</th> <th style="width:500px">제 목</th> 
                <th style="width:120px">올린사람</th> <th style="width:180px">날 짜</th>
            </tr>
            <%
            	FvrDAO fvrDAO = new FvrDAO();
            	ArrayList<Fvr> list = fvrDAO.getfreeList(pageNumber);
            	for(int i = 0; i < list.size(); i++) {
            %>
            <tr>
                <th><%= list.get(i).getF_NUM() %></th> 
                <th><a href="freeview.jsp?F_NUM=<%= list.get(i).getF_NUM() %>"><%= list.get(i).getF_Title() %></a></th> 
                <th><%= list.get(i).getUser_ID() %></th> 
                <th><%= list.get(i).getF_DATE().substring(0, 11) + list.get(i).getF_DATE().substring(11, 13) + "시" + list.get(i).getF_DATE().substring(14, 16) + "분" %></th>
            </tr>
			<%
            	}
            %>
            <tr style="background-color: transparent !important;">
            <th colspan="3" style="border:0px solid white; text-align: left;">
            <%
        	if(pageNumber != 1) {
       		%>
        	<a href="free.jsp?pageNumber=<%=pageNumber - 1%>"><input type=button value="이전 페이지"></a>
        	<%
        	} if(fvrDAO.nextPage(pageNumber + 1)) {
        	%>
        	<a href="free.jsp?pageNumber=<%=pageNumber + 1%>"><input type=button value="다음 페이지"></a>
        	<%
        	}	
        	%>
       
        </table>
    </div>
    </body>
</html>