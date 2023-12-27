
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
 	
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
<link rel="shortcut icon" href="../assets/img/favicon.png">
<title>코딩포차</title>
    <jsp:include page="../import/link.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/lib/stroke-7/style.css" />
<link rel="stylesheet" type="text/css"
	href="${path}/resources/assets/lib/perfect-scrollbar/css/perfect-scrollbar.css" />
<link rel="stylesheet" href="${path}/resources/assets/css/app.css" type="text/css" />
<jsp:include page="../import/link.jsp"></jsp:include>
</head>
<body>
<c:set var="authenticatedMemberId" value="${sessionScope.authenticatedMemberId}" />
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
	<div class="main-content container">
		<div class="user-profile">
			<div class="row">
				<!-- 내정보 -->
				<div class="col-md-4">
					<div class="user-info-list card card-default">
						<div class="card-header card-header-divider">내정보</div>
						<div class="card-body">
							<table class="no-border no-strip skills">
								<tbody class="no-border-x no-border-y">
									<tr>
										<td class="icon"><span class="icon s7-portfolio"></span></td>
										<td class="item">아이디</td>
										<td><a href="#">${membervo.id}</a></td>
									</tr>
									<tr>
										<td class="icon"><span class="icon s7-gift"></span></td>
										<td class="item">이메일</td>
										<td><a href="#">${membervo.email}</a></td>
									</tr>
									<tr>
										<td class="icon"><span class="icon s7-phone"></span></td>
										<td class="item">주소</td>
										<td><a href="#">${membervo.address}</a></td>
									</tr>
									<tr>
										<td class="icon"><span class="icon s7-global"></span></td>
										<td class="item">전화번호</td>
										<td><a href="#">${membervo.phoneNum}</a></td>
									</tr>
									</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 차트 -->
				<div class="col-md-6">

					<div id="container" style="height: 100%; width: 134%"></div>
				</div>
			</div>
		</div>


	</div>

	<!-- 최근에 푼 문제 리스트 -->
<div class="main-content container">
  <div class="col-sm-12">
    <div class="card-header">
      최근에 푼 문제 리스트
    </div>
 
    <div class="project-item">
      <div class="project-item-title">
        <span class="name" id = "num"><strong>번호</strong></span>
        <span class="position-description" id = "num_content"></span>
      </div>
      <div class="project-item-user">
        <div class="user-info">
          <span class="name" id = "title"><strong>제목</strong></span>
          <span class="position-description" id = "title_content"></span>
        </div>
      </div>
      <div class="project-item-state">
        <span class="name" id = "language"><strong>사용언어</strong></span>
        <span class="position-description" id = "language_content"></span> 	
      </div>
      <div class="project-item-date">
     <span class="date" id = "createtime"><strong>문제를 풀었던 날짜</strong></span>
        <span class="position-description" id = "createtime_content"></span>
      </div>
      <div class="project-item-go">
        <span>
          <button class="btn btn-rounded btn-space btn-secondary" id="btnGoMatter" onclick="goToProblem()">
            해당 문제 보기
          </button>
        </span>
      </div>
    </div>
 
  </div>
</div>










	<!-- 최근에 본 문제 리스트 -->
<div class="main-content container">
  <div class="col-sm-12">
    <div class="card-header">
      최근에 확인한 문제
    </div>
   
   
    <div class="project-item">
      <div class="project-item-title">
        <div class="user-info">
          <span class="name" id = "title"><strong></strong></span>
        </div>
      </div>
   <div class="project-item-state">
     <span class="date" id = "createtime"><strong>사용언어</strong></span>
        <span class="position-description" id = "createtime_content"></span>
      </div>
   
      
          <div class="project-item-state">
     <span class="date" id = "createtime"><strong>난이도</strong></span>
        <span class="position-description" id = "createtime_content"></span>
      </div>
      
         <div class="project-item-date">
     <span class="date" id = "createtime"><strong>최근본 날짜</strong></span>
        <span class="position-description" id = "createtime_content"></span>
      </div>
      
      
      
      <div class="project-item-go">
        <span>
          <button class="btn btn-rounded btn-space btn-secondary" id="btnGoMatter" onclick="location.href = '../question/PlayCodingpg.jsp?q_num='">
            해당 문제 보기
          </button>
        </span>
      </div>
    </div>
   
  </div>
</div>






 <div class="main-content container">
       
          <div class="col-sm-12">
            <div class="card card-default card-table">
              <div class="card-header">언어별 문제 리스트
           
              </div>
              <div class="card-body">
                <table class="table table-striped table-hover" id="table1">
                  <thead>
                    <tr>
          <th width = "10%"> 언어</th>
          <th width = "10%"> 맞은 문제 </th>
          <th width = "10%"> 틀린 문제 </th>
           <th width = "10%"> 시간초과</th>
            <th width = "10%"> 컴파일 에러 </th>
             <th width = "10%"> 정답 비율 </th>
       
                </tr>
                  </thead>
                  <tbody>
                     <tr class="">
                      <td class="center">Java</td>
                      <td class="center"></td>
                      <td class="center"></td>
                       <td class="center"></td>
                        <td class="center"></td>
                         <td class="center">30%</td>
                    
                    </tr>
                    
                    <tr class="">
                      <td class="center">C#</td>
                       <td class="center"></td>
                      <td class="center"></td>
                       <td class="center"></td>
                        <td class="center"></td>
                         <td class="center">50%</td>
                    
                    </tr>   <tr class="">
                      <td class="center">Python</td>
      <td class="center"></td>
                      <td class="center"></td>
                       <td class="center"></td>
                        <td class="center"></td>
                         <td class="center">30%</td>
                    
                    </tr>  
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>



	<script src="${path}/resources/assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
	<script src="${path}/resources/assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js"
		type="text/javascript"></script>
	<script src="${path}/resources/assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="${path}/resources/assets/js/app.js" type="text/javascript"></script>
	<script src="${path}/resources/assets/lib/moment.js/min/moment.min.js"
		type="text/javascript"></script>
	<script src="${path}/resources/assets/lib/jquery-ui/jquery-ui.min.js"
		type="text/javascript"></script>
	<script src="${path}/resources/assets/lib/jquery.fullcalendar/fullcalendar.min.js"
		type="text/javascript"></script>
	<script src="${path}/resources/assets/js/app-pages-calendar.js" type="text/javascript"></script>
	<script src="${path}/resources/assets/js/echarts.min.js"></script>
		<script src="${path}/resources/assets/js/profile.js"></script>
	

</body>
</html>