<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
            	width:450px;
                height:25px;
            }
            tr {
                background-color: white;
            }
        </style>
    </head>
    <body>
        <div class=contain>
        <br><br>
        <b>글 작성하기</b>
        <br><br>
       <form method="post" action="freewriteAction.jsp">
        <table style="margin-left:auto;margin-right:auto;">
        <tr>
        <th colspan=2><input type="text" placeholder="글 제목" name="f_Title" maxlength="50"></th>
        </tr>
        <tr>
        <th colspan=2><textarea placeholder="글 내용" name="f_Content" cols=61 rows=30></textarea></th>
        </tr>
       
        
        <tr style="background-color: transparent !important;">
        <th colspan=2 style="border:0px solid white; text-align: right;"><input type="submit" value="작성하기">
        <a href="free.jsp" target=if1><input type="button" value="돌아가기"></a>
        </th>
        </tr>
        </table>
        </form>
    </div>
    </body>
</html>