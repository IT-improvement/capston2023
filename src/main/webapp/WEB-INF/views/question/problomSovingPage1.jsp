<%@page import="java.util.List"%>

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
    <link rel="shortcut icon" href="${path}/resources/assets/img/favicon.png">
    <title>코딩포차</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/lib/stroke-7/style.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
    <link rel="stylesheet" href="${path}/resources/assets/css/app.css" type="text/css"/>
    <link rel="stylesheet" href= "${path}/resources/assets/css/list.css"/>
<jsp:include page="../import/link.jsp"></jsp:include>
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
		
		</div>      <!-- 자료 리스트 -->
      <div class="main-content container">
        <form name="moveform">
      <div class="movePage1">
		<div class="title">페이지 이동하기 </div>
		  
     <div class="left">
		 <input type="checkbox" name="languageChecked" value="JAVA"> JAVA<br>
		 <input type="checkbox" name="languageChecked" value="PYTHON">PYTHON<br>
		 <input type="checkbox" name="languageChecked" value="MySql"> MySql<br>
		 
	</div>
	<div class="right">
		<input type="checkbox" name="languageChecked" value="C"> C<br>
		<input type="checkbox" name="languageChecked" value="Cshap"> C#<br>
	</div>
	<button type="button" class="movebtn" onclick="moveQuestionPage()">선택 언어 보기(선택X : 모든문제)</button>
<span id="result"></span>
</div>
</form>
          <div class="col-sm-12">
            <div class="card card-default card-table">
              <div class="card-header">문제 리스트 
           
              </div>
              <div class="card-body">
                <table class="table table-striped table-hover" id="table1">
                  <thead>
                    <tr>
        <th width = "10%"> 문제 번호 </th>
          <th width = "45%"> 문제 제목 </th>
           <th width = "15%"> 언어 </th>
          <th width = "15%"> 난이도 </th>
     
                </tr>
                  </thead>
                  <tbody>
                       <c:forEach var="question" items="${questionList}">
                <tr>
                    <td class="center">${question.q_num}</td>
                    <td class="center"><a href="${path}/playCoding?q_num=${question.q_num}">${question.q_title}</a></td>
                    <td class="center">${question.q_language}</td>
                    <td class="center">${question.q_level}</td>
                </tr>
            </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
 
     

    
    <script src="${path}/resources/assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/js/app.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/datatables/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/datatables/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/datatables/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/datatables/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/datatables/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/datatables/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/datatables/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/lib/datatables/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/js/app-tables-datatables.js" type="text/javascript"></script>
    <script src="${path}/resources/assets/js/movepage.js" type="text/javascript"></script>
    <script type="text/javascript">
    function moveQuestionPage(){
    	const Language = [];
    	const land = document.getElementsByName('languageChecked');
    	for(let i=0; i<land.length; i++){
    		if(land[i].checked == true){
    			Language.push(land[i].value);
    		}
    	}
    	  var form = document.forms["moveform"];
          if (form) {
              form.method = "get";
              if (Language.length === 0) {
                  window.location.href = "${path}/questionList";
              } else {
                  form.action = "${path}/problomSovingPage1";
                  form.submit();
              }
          } else {
              console.error("Form not found");
          }
      }
      $(document).ready(function(){
         //-initialize the javascript
         App.init();
         App.dataTables();
      });
    </script>
  </body>
</html>