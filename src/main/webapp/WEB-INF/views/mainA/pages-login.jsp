<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>코딩포차</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

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

        .login-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 60px; /* 크기를 두 배로 키움 */
            text-align: center;
            width: 800px; /* 크기를 두 배로 키움 */
        }

        .logo-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 40px; /* 크기를 두 배로 키움 */
        }

        .logo-container img {
            width: 300px; /* 이미지 크기를 두 배로 키움 */
            height: 200px; /* 이미지 크기를 두 배로 키움 */
            margin-right: 0px; /* 간격을 두 배로 키움 */
            border-radius: 50%;
        }

        .logo-container h2 {
            color: #2ecc71;
            font-size: 48px; /* 폰트 크기를 두 배로 키움 */
        }

        .form-group input {
            width: 100%;
            padding: 30px; /* 패딩을 두 배로 키움 */
            box-sizing: border-box;
            border: 2px solid #ddd; /* 테두리를 조금 굵게 키움 */
            border-radius: 8px; /* 테두리 반경을 조금 더 키움 */
            margin-top: 20px; /* 간격을 두 배로 키움 */
            transition: border-color 0.3s;
            font-size: 18px; /* 폰트 크기를 두 배로 키움 */
        }

        .form-group input:focus {
            border-color: #2ecc71;
        }

        .form-group button {
            width: 100%;
            padding: 30px; /* 패딩을 두 배로 키움 */
            box-sizing: border-box;
            border: none;
            border-radius: 8px; /* 테두리 반경을 조금 더 키움 */
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 20px; /* 폰트 크기를 두 배로 키움 */
        }

        .form-group button:hover {
            background-color: #27ae60;
        }

        .forgot-password {
            margin-top: 30px; /* 간격을 두 배로 키움 */
            color: #2ecc71;
            font-size: 18px; /* 폰트 크기를 두 배로 키움 */
        }

        .create-account {
            margin-top: 40px; /* 간격을 두 배로 키움 */
            color: #2ecc71;
            font-size: 18px; /* 폰트 크기를 두 배로 키움 */
        }

        .create-account a {
            text-decoration: none;
            color: #2ecc71;
        }

        .create-account a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <div class="logo-container">
            <img src="${path}/resources/assets/img/capston_logo.jpg" alt="Bee Logo">
        </div>
        <form action="${path}/loginConfirm" method="post" name="loginConfirm" id="loginConfirm">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="아이디" name="id" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="비밀번호" name="pwd" required>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-primary" onclick="fund()">로 그 인</button>
            </div>
        </form>
        <p class="forgot-password"><a href="${path}/pagesForgetPwd">비밀번호를 잊어버리셨나요?</a></p>
        <p class="create-account">계정이 없으신가요? <a href="${path}/createAccountForm">회원가입</a></p>
   		<c:if test="${loginFailed}">
    <script>
        alert("아이디 또는 비밀번호가 잘못되었습니다. 다시 입력해주세요.");
    </script>
</c:if>
    </div>
<script type="text/javascript">
	
  function fund() {
    var logform = document.getElementById("loginConfirm");
    var id = logform.id.value;
    var pwd = logform.pwd.value;
    if (id.length === 0 || id === "") {
    	  alert("아이디를 입력하세요");
    	  logform.id.focus();
    	} else if (pwd.length === 0 || pwd === "") {
    	  alert("비밀번호를 입력하세요");
    	  logform.pwd.focus();
    	} else {
    	  logform.submit();
    	}
  }

  $(document).ready(function(){
    //-initialize the JavaScript
    // App.init()와 관련된 코드가 있어야 정의될 때 에러가 발생하지 않습니다.
  });
</script>
  </body>
</html>