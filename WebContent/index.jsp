<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Project</title>
</head>
<style>
            body {
                margin: 0;
                padding: 0;
                font-family: "Roboto", serif;
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
                overflow-x: hidden;  
            }

            h1 {
                margin: 1em 0 1.5em 0;
                text-shadow : 2px 2px 2px gray;
            }

            nav {
                width: 100%;
                display: flex;
                justify-content: center;
                position: relative;
                background: linear-gradient(90deg, #000000, #252525, #646464, #b8b8b8, #e0dede);
            }

            ul, li {
                margin: 0;
                padding: 0;
                list-style: none;
            }

            #main-menu > li {
                float: left;
                position: relative;
                width: 150px;
            }

            #main-menu > li > a {
                font-size: 0.85rem;
                color: rgba(255,255,255,0.85);
                text-align: center;
                text-decoration: none;
                letter-spacing: 0.05em;
                display: block;
                padding: 14px 25px;
                border-right: 1px solid rgba(0,0,0,0.15);
                text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
            }

            #main-menu > li:nth-child(1) > a {
                border-left: 1px solid rgba(0,0,0,0.15);
            }

            #sub-menu {
                position: absolute;
                background: #3d3d3d;
                opacity: 0;
                visibility: hidden;
                transition: all 0.15s ease-in;
                width: 150px;
                text-align: center;
            }

            #sub-menu > li {
                padding: 16px 10px;
                border-bottom: 1px solid rgba(0,0,0,0.15);
            }

            #sub-menu > li >  a {
                color: rgba(255,255,255,0.6);
                text-decoration: none;
                display:inline-block;
                width:100%;
            }

            #main-menu > li:hover #sub-menu {
                opacity: 1;
                visibility: visible;
                z-index: 1;
            }

            #sub-menu > li:hover {
                background-color: #646464;
            }

            section {
                width:100%;
                height:770px;
            }

            footer {
                text-align: center;
                
                width:100%;
                height:43;
                color:white;
                background: linear-gradient(90deg,#e0dede,#b8b8b8, #646464,#252525, #000000,#252525, #646464,#b8b8b8, #e0dede);
            }
            .tag {
                width:100%;
                text-align: right;
                padding-top:5px;
                padding-bottom:5px;
                background: linear-gradient(90deg, #ffffff, #ffffff, #ffffff, #e2e2e2, #c9c9c9);
            }
            .tag > a {
                text-decoration: none;
                color:#000000;
                font-weight: bold;
                font-family: 함초롬바탕;
                text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
            }
            span {
                display: inline-block;
                border: 1px solid rgb(170, 170, 170);
                line-height: 2;
                padding: 0px 2px;
            }
            span:hover {
                background-color: black;
                color: white;
            }
            h5 {
                margin: 0.5em 0 0.5em 0;
            }
            a:hover	{
				color:blue;
	}
        </style>
    </head>
    <body>
    <%
    	String user_ID = null;
    	if(session.getAttribute("user_ID") != null) {
    		user_ID =(String) session.getAttribute("user_ID");
    	}
    %>
    <%
    	if(user_ID == null) {
    %>
    <div class=tag>
            <a href="login.jsp"><span>Login</span></a>
            <a href="sign.jsp"><span>SignUp</span></a>
            &nbsp;
    </div>
    <%
    	} else {
    %>
    <div class=tag>
            <a href="info.jsp" target=if1><%=user_ID %> 님 환영합니다.</a>
            <a href="logoutAction.jsp"><span>Logout</span></a>
            &nbsp;
    </div>
    <%
    	}
    %>
    
    
    <div style="padding-top:20px;">
        <a href="index.jsp"><img src="img/main.jpg" width=200px></a>
        </div>
    <h1>MOVIE REVIEW CLUB</h1>
    <nav role="navigation">
      <ul id="main-menu">
        <li><a href="notice.jsp" target=if1>공지사항</a></li>
        <li><a>Q&A게시판</a></li>
        <li><a>영화목록</a>
          <ul id="sub-menu">
            <li><a href="rating.jsp" aria-label="subemnu" target=if1>추천영화</a></li>
            <li><a href="all.jsp" aria-label="subemnu" target=if1>전체영화</a></li>
            <li><a href="https://www.cgv.co.kr/" aria-label="subemnu" target=_blank>예매하기</a></li>
          </ul>
        </li>
        <li><a>영화리뷰</a>
          <ul id="sub-menu">
            <li><a href="Review.jsp" aria-label="subemnu" target=if1>리뷰게시판</a></li>
          </ul>
        </li>
        
        <li><a href="free.jsp" target="if1">자유게시판</a></li>
      </ul>
    </nav>
    <section>
    	<iframe src="main.jsp" width=100% height=100% scolling=no 
    	name=if1 frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0></iframe>
    	</section>
    <footer>
        <h5>제작자 : 1589069 정보통신공학과 황인성, 1590057 전자공학과 최중환<br>
            e-mail : dlstjd2029@naver.com & rorkcks3@naver.com
        Phone-number : 010-8731-7627 / 010-5015-5317</h5>
    </footer>
    </body>
</html>