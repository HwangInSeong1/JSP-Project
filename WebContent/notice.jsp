<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
    <head>
        <meta charset="UTF-8">
        <title>
            공지사항
        </title>
        <style>
            strong {font-size:30px;text-shadow:2px 2px 2px gray;}
            th {border:1px solid black;}
            b {font-size:30px;text-shadow:2px 2px 2px gray;}
            tr:nth-child(1) {
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
            tr:nth-child(2),
            tr:nth-child(3),
            tr:nth-child(4),
            tr:nth-child(5),
            tr:nth-child(6),
            tr:nth-child(7),
            tr:nth-child(8),
            tr:nth-child(9),
            tr:nth-child(10),
            tr:nth-child(11),
            tr:nth-child(12),
            tr:nth-child(13),
            tr:nth-child(14) {
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
        <h1>공 지 사 항</h1>
        <br>
        <table style="margin-left:auto;margin-right:auto;">
            <tr>
                <th style="width:100px">번 호</th> <th style="width:500px">제 목</th> 
                <th style="width:120px">올린사람</th> <th style="width:180px">날 짜</th>
            </tr>
            <tr>
                <th>001</th> <th><a href="#" class=a1>[필독]사이트 이용수칙</a></th> 
                <th>관리자</th> <th>2021-05-26</th>
            </tr>
            <tr>
                <th>002</th> <th><a href="#">사이트 내 버그 수정.ver1</a></th> 
                <th>관리자</th> <th>2021-05-26</th>
            </tr>
            <tr>
                <th>003</th> <th><a href="#">글자깨짐 현상 있을시 해결방법</a></th> 
                <th>관리자</th> <th>2021-05-26</th>
            </tr>
            <tr>
                <th>004</th> <th><a href="#">사이트 내 버그 수정.ver2</a></th> 
                <th>관리자</th> <th>2021-05-26</th>
            </tr>
            <tr>
                <th>005</th> <th><a href="#">로그인이 되지 않을 때,화면이 깨질 때 참고하세요.</a></th> 
                <th>관리자</th> <th>2021-05-26</th>
            </tr>
            <tr style="background-color: transparent !important;">
                <th colspan="4" style="border:0px solid white;text-align: right;">
                    <input type=button value="검색"> <input type=text size=30>
                </th>
            </tr>
        </table>
    </div>
    </body>
</html>