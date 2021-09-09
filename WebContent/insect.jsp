<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="mvr.MvrDAO" %>
<%@ page import="mvr.Mvr" %>
<%@ page import="java.util.ArrayList" %>
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
    
        <div class=contain>
        <br>
        	<h1>리뷰게시판 [기생충]</h1>
        	
        <br>
        <table style="margin-left:auto;margin-right:auto;">
        <tr>
        <th colspan=2 style="border:0px solid white;text-align:left">
        <select onchange="if(this.value) location.href=(this.value);">
        	<option> 영화선택 </option>
        	<option value="joker.jsp"> 조커 </option>
        	<option value="avenger.jsp"> 어벤져스 </option>
        	<option value="bwar.jsp"> 봉오동전투 </option>
        	<option value="insect.jsp"> 기생충 </option>
        </select>
        </th>
        <th colspan=2 style="border:0px solid white;"> <a href="write.jsp" target=if1><input type=button value="작성하기"></a></th>
        </tr>
            <tr>
                <th style="width:100px">번 호</th> <th style="width:500px">제 목</th> 
                <th style="width:120px">올린사람</th> <th style="width:180px">날 짜</th>
            </tr>
            <%
            	MvrDAO mvrDAO = new MvrDAO();
            	ArrayList<Mvr> list04 = mvrDAO.getList04();
            	for(int i = 0; i < list04.size(); i++) {
            %>
            <tr>
                <th><%= list04.get(i).getR_NUM() %></th> 
                <th><a href="view.jsp?R_NUM=<%= list04.get(i).getR_NUM() %>"><%= list04.get(i).getR_Title() %></a></th> 
                <th><%= list04.get(i).getUser_ID() %></th> 
                <th><%= list04.get(i).getR_DATE().substring(0, 11) + list04.get(i).getR_DATE().substring(11, 13) + "시" + list04.get(i).getR_DATE().substring(14, 16) + "분" %></th>
            </tr>
			<%
            	}
            %>
           
            
       
        </table>
    </div>
    </body>
</html>