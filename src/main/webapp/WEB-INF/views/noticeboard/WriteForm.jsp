<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="${path}/resources/assets/img/favicon.png">
<title>기출 문제 리스트 페이지</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/lib/stroke-7/style.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/lib/perfect-scrollbar/css/perfect-scrollbar.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css" />
<link rel="stylesheet" href="${path}/resources/assets/css/app.css" type="text/css" />
<link rel="stylesheet" href="${path}/resources/assers/css/list.css" />
<jsp:include page="../import/link.jsp"></jsp:include>
<style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            background-color: #f8f9fa;
            color: #343a40;
        }

       

        .card {
            width: 80%;
            margin-bottom: 20px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .card-header, .comment-header {
            background-color: #343a40;
            color: #fff;
            padding: 10px;
            border-radius: 5px 5px 0 0;
        }

        .card-body, .comment-body {
            padding: 20px;
        }

        .comment-card {
            background-color: #f8f9fa;
        }

        .comment-form {
            margin-top: 20px;
        }

        h2 {
            color: #343a40;
        }

        p {
            color: #495057;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Add border styles */
        .card, .comment-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .btn-warning, .btn-danger, .btn-primary {
            margin-right: 10px;
        }

        .pagination {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        textarea {
            resize: none;
        }

        .btn-primary, .btn-danger {
            width: 100px;
        }
        
    </style>
</head>
<body>
<!-- 최상위메뉴버 -->
	<nav class="navbar navbar-expand navbar-dark mai-top-header">
		<div class="container">
			<a class="navbar-brand" href=""><img src="${path}/resources/assets/img/capston_logo_ex3.jpg" class="logo_img" alt="꿀벌코딩"></a>
			
			<ul class="nav navbar-nav mai-top-nav">
				<li class="nav-item"><a class="nav-link" href="${path}/main_page">메인</a></li>
				<li class="nav-item"><a class="nav-link" href="${path}/about">About</a></li>
			</ul>
			<!-- 프로필 -->
			<ul class="nav navbar-nav float-lg-right mai-user-nav">
				<li class="dropdown nav-item"><a
					class="dropdown-toggle nav-link" href="#" data-toggle="dropdown"
					role="button" aria-expanded="false"><img
						src="" alt=""><span
						class="user-name">${authenticatedMemberId}</span><span
						class="angle-down s7-angle-down"></span></a>
					<div class="dropdown-menu" role="menu">
							<a class="dropdown-item" href="${path}/myprofile?id=${authenticatedMemberId}"><span
							class="icon s7-user"></span>Profile</a>
							<a
							class="dropdown-item" href="${path}/logout"><span
							class="icon s7-power"></span>Log Out</a>
					</div></li>
			</ul>
		</div>
	</nav>
	
		<!-- 메뉴바 -->
	<div class="mai-wrapper">
		<nav class="navbar navbar-expand-lg mai-sub-header">
			<div class="container">
				<nav class="navbar navbar-expand-md">
					<button class="navbar-toggler hidden-md-up collapsed" type="button"
						data-toggle="collapse" data-target="#mai-navbar-collapse"
						aria-controls="mai-navbar-collapse" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"><span></span><span></span><span></span></span>
					</button>
					<div class="navbar-collapse collapse mai-nav-tabs"
						id="mai-navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="nav-item parent open"><a class="nav-link"
								href="#" role="button" aria-expanded="false"><span
									class="icon s7-home"> </span><span>메인페이지</span></a>
								<ul class="mai-nav-tabs-sub mai-sub-nav nav">
									<li class="nav-item"><a class="nav-link active"
										href="${path}/main_page"><span class="icon s7-monitor"></span> <span
											class="name">메인페이지</span></a>
								</ul></li>
							<li class="nav-item parent"><a class="nav-link" href="#"
								role="button" aria-expanded="false"> <span
									class="icon s7-diamond"></span><span>코딩테스트</span></a>
								<ul class="mai-nav-tabs-sub mai-sub-nav nav">
									<li class="nav-item"><a class="nav-link" href="${path}/questionList"> <span
											class="icon s7-diamond"></span> <span class="name">문제</span></a>
									</li>
								</ul></li>
							<li class="nav-item parent"><a class="nav-link" href="#"
								role="button" aria-expanded="false"><span
									class="icon s7-rocket"></span><span>채팅방</span></a>
								<ul class="mai-nav-tabs-sub mai-sub-nav nav">
									<li class="nav-item"><a class="nav-link" href="${path}/openchat"> <span
											class="icon s7-diamond"></span> <span class="name">오픈채팅</span></a>
									</li>
								</ul></li>
								<li class="nav-item parent"><a class="nav-link" href="#"
								role="button" aria-expanded="false"><span
									class="icon s7-rocket"></span><span>게시판</span></a>
								<ul class="mai-nav-tabs-sub mai-sub-nav nav">
									<li class="nav-item"><a class="nav-link" href="${path}/noticeboard"> <span
											class="icon s7-diamond"></span> <span class="name">게시판</span></a>
									</li>
									
								</ul></li>
						</ul>
					</div>
				</nav>
			</div>
		</nav>
		
		</div>
      
      <div class="main-content container">
        <div class="col-sm-12">
            <div class="card card-default card-table">
                
                <div class="card-body">
                    <form action="${path}/addPost" method="post" >
                        <div class="form-group">
                        <div class="card-header">게시글 작성</div><br>
                            <label for="title"><h4>&nbsp;&nbsp;제목</h4></label>
                            <input type="text" name="title" id="title" class="form-control" required="required"/>
                        </div>
                        <br>
                        <div class="form-group2">
                            <label for="content"><h4>&nbsp;&nbsp;내용</h2></label>
                            <textarea name="content" id="content" class="form-control" required="required" rows="7"></textarea>
                        </div>
                        <br>
                        <!-- Add more input fields or customize the form as needed -->
                        <input type="hidden" value="${authenticatedMemberId}" name="name">
                        <button type="submit" class="btn btn-success">게시글 추가</button>
                                            <button onclick="history.back()" class="btn btn-danger">뒤로가기</button>
                        
                    </form>
                </div>
            </div>
        </div> 
      </div>

    <script type="text/javascript">
      $(document).ready(function(){
      	//-initialize the javascript
      	App.init();
      });
      
    </script>
  </body>
</html>