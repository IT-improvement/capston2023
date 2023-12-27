<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Change Success</title>
    <style>
        body {
            text-align: center;
            margin-top: 100px;
            font-family: Arial, sans-serif;
        }
        
        h2 {
            color: #4CAF50;
        }
    </style>
</head>
<body>
<%   String userId = (String) session.getAttribute("UserId");
%>
    <h2> 비밀번호 변경 완료!!</h2>
    <p><%= userId %>님의 비밀번호는 성공적으로 변경 되었습니다!</p>
</body>
</html>