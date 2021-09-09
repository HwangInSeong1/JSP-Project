<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
    <head>
        <title>
            Login
        </title>
        <meta charset="UTF-8">
        <style>
            body {
                background-color: black;
            }
            #id {
                width:80%;
                height:100%;
                background-color: white;
                text-align: center;
                margin:auto auto;
            }
            table {
                margin:auto;
                width: 350px;
                height: 100px;
            }
            tr, td {
                border:1px solid black;
                text-align: center;
            }
            input[type=submit],input[type=button] {
                font-size:13pt;
                background-color: black;
                color: white;
                height:35px;
                width: 80px;
            }
            input[type=text],[type=password] {
                height: 30px;
            }
            p {
                font-family: "Roboto", serif;
                font-size: 20pt; 
            }
        </style>
    </head>
    <body>
        <div id=id>
            <br><br><br><br><br><br><br><br><br>
            <a href="index.jsp" target=_self><img src="img/main.jpg" width=400 height=270></a>
            <br>
            <p><b>MOVIE REVIEW CLUB</b></p>
            <br>
        <form method="post" action="loginAction.jsp">
        <table>
            <tr>
                <td style="width:30%;background-color:black;color:white"><b>ID</b></td> 
                <td style="background-color:black;color:white"><input type=text size=28 name="user_ID" placeholder="아이디 입력"></td>
            </tr>
            <tr>
                <td style="width:30%;background-color:black;color:white"><b>PW</b></td> 
                <td style="background-color:black;color:white"><input type=password size=28 name="user_PW" placeholder="비밀번호 입력"></td>
            </tr>
            <tr>
                <td colspan="2" style="padding:5px;border:1px solid white;">
                    <input type=submit value=login>
                    <a href="sign.jsp"><input type=button value=Signup></a></td>
            </tr>
        </table>
        </form>
        계정이 없으신가요? <a href="sign.jsp">[회원가입 바로가기]</a>
        </div>
    </body>
</html>