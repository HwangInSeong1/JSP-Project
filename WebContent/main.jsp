<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Project</title>
	<style>
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
            .title {
                font-size: 80px;
                color:black;
                font-family: "Roboto", serif;
                padding-top: 20px;
                text-shadow: 5px 2px 2px rgba(0,0,0,0.3);
            }
            p {
                font-size: 35px;
                font-family: "Roboto", serif;
                text-shadow: 5px 2px 2px rgba(0,0,0,0.3);
            }
            span {
                display: inline-block;
                border:2px solid black;
                line-height: 300px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                width: 300px;
                padding:0px 5px;
                font-size: 20pt;
                color: black;
            }
            span:hover {
            	background-color : black;
            }
            b {
                font-size: 1.8em;
                text-shadow: 3px 2px 2px rgba(0, 0, 0, 0.5);
            }
            img {
            	width : 300px;
            	height : 500px;
            	object-fit: cover;
            }
	</style>
</head>
<body>
	<div class="contain">
	<br><br>
	<a href="joker.jsp" target=if1><span><img src="img/조커.jpg"></span></a>&nbsp;&nbsp;&nbsp;&nbsp; 
	<a href="insect.jsp" target=if1><span><img src="img/기생충.jpg"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="avenger.jsp" target=if1><span><img src="img/어벤져스.jpg"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="bwar.jsp" target=if1><span><img src="img/봉오동전투.jpg"></span></a>
	<br><br>
	</div>
</body>