<%@page import="org.springframework.context.support.GenericXmlApplicationContext"%>
<%@page import="com.codingtest.board.BoardDao"%>
<%@page import="com.codingtest.question.QuestionDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.codingtest.admin.member.MemberVo"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.codingtest.admin.member.MemberDao"%>
<%@page import="com.codingtest.question.QuestionVo"%>
<%@page import="com.codingtest.question.QuestionDao"%>
<%@page import="com.codingtest.board.BoardVo"%>
<%@page import="com.codingtest.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .mai-forgot-password {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            width: 400px;
        }

        .splash-message {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        .splash-description {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: none;
            border-radius: 4px;
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
            font-size: 18px;
        }

        .btn:hover {
            background-color: #27ae60;
        }

        .contact {
            margin-top: 15px;
            font-size: 16px;
            color: #2ecc71;
        }
    </style>
</head>

<body class="mai-splash-screen">
    <div class="mai-forgot-password">
        <div class="splash-message">코딩포차<br>비밀번호 찾기</div>
        <div class="splash-description">등록된 회원 이메일을 입력해주세요</div>
        <form action="${path}/changePwdConfirm" id="changePwdConfirm" name="changePwdConfirm" method="post">
            <div class="form-group">
                <div class="input-group">
                    <input id="username" type="text" placeholder="아이디" autocomplete="off" name="id">
                </div>
                 <div class="input-group">
                    <input id="email" type="text" placeholder="이메일" autocomplete="off" name="email">
                </div>
                <div class="input-group">
                    <select name="question" id="question">
                        <option value="------선택하세요------">------선택하세요------</option>
                        <option value="내가 아끼는 1순위는?">내가 아끼는 1순위는?</option>
                        <option value="내가 졸업한 초등학교는?">내가 졸업한 초등학교는?</option>
                    </select>
                </div>
                <div class="input-group">
                    <input name="answer" id="answer" type="text" placeholder="답변" autocomplete="off">
                </div>
            </div>
            <div class="form-group">
                <button class="btn" onclick="return pwdfund()">비밀번호 찾기</button>
            </div>
        </form>
        <p class="contact">일행이 없으신가요?<a href="${path}/loginGo">회원가입하러가기</a></p>
    </div>
    <script src="${path}/resources/assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/js/app.js" type="text/javascript"></script>
    <script type="text/javascript">
    function pwdfund() {
        var changepwd = document.getElementById('changePwdConfirm');
        var id = changepwd.id.value;
        var email = changepwd.email.value; // 추가된 부분
        var question = changepwd.question.value;
        var answer = changepwd.answer.value;
        if (id.length === 0 || id === "") {
            alert("아이디를 입력하세요");
            changepwd.id.focus();
            return false;
        } else if (email.length === 0 || email === "") { // 추가된 부분
            alert("이메일을 입력하세요");
            changepwd.email.focus();
            return false;
        } else if (question == "------선택하세요------") {
            alert("질문을 선택하세요");
            changepwd.question.focus();
            return false;
        } else if (answer.length == 0 || answer == "") {
            alert("답변을 입력하세요");
            changepwd.answer.focus();
            return false;
        } else {
            changepwd.submit();
        }
    }
    </script>
</body>

</html>