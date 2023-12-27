<%@page
	import="org.springframework.context.support.GenericXmlApplicationContext"%>
<%@page import="com.codingtest.board.BoardDao"%>
<%@page import="com.codingtest.question.QuestionDao"%>
<%@page
	import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.codingtest.admin.member.MemberVo"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.codingtest.admin.member.MemberDao"%>
<%@page import="com.codingtest.question.QuestionVo"%>
<%@page import="com.codingtest.question.QuestionDao"%>
<%@page import="com.codingtest.board.BoardVo"%>
<%@page import="com.codingtest.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>코딩포차</title>
<jsp:include page="../import/link.jsp"></jsp:include>
</head>
<body>
	<!--  메뉴바 -->
<c:set var="authenticatedMemberId" value="${sessionScope.authenticatedMemberId}" />
<!-- 여기서 authenticatedMemberId는 MemberController에서 세션에 저장한 키입니다. -->
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
	
	<!-- 현황 -->
	<div class="main-content container">
		<!--광구-->
		<div class="row">
			<div class="imgclass">
				<img class="slide1"
					src="${path}/resources/assets/img/capston_ad.png"> <img
					class="slide1" src="${path}/resources/assets/img/capston_ad02.png">
				<img class="slide1"
					src="${path}/resources/assets/img/capston_ad03.png">
			</div>
		</div>
		<div class="row">

			<div class="col-md-6">
				<div class="project-list-title">언어 선호도</div>
				<div class="widget widget-fullwidth">
					<div class="widget-head">
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>

			<!-- 총 접속자수 표 -->
			<div class="col-md-6">
				<div class="widget-indicators">
					<div class="indicator-item">
						<div class="indicator-item-icon">
							<div class="icon">
								<span class="s7-graph1"></span>
							</div>
						</div>
						<div class="indicator-item-value">
							<span class="indicator-value-counter" data-toggle="counter"
								data-end="${userCount}"><c:out value=" ${userCount}" /></span>
							<div class="indicator-value-title">유저 수</div>
						</div>
					</div>
					<div class="indicator-item">
						<div class="indicator-item-icon">
							<div class="icon">
								<span class="s7-graph"></span>
							</div>
						</div>

						<div class="indicator-item-value">
							<span class="indicator-value-counter" data-toggle="counter"
								data-end="157"><c:out value=" ${nowUserCount}" /></span>
							<div class="indicator-value-title">현재 접속자 수</div>
						</div>
					</div>
					<div class="indicator-item">
						<div class="indicator-item-icon">
							<div class="icon">
								<span class="s7-graph3"></span>
							</div>
						</div>

						<div class="indicator-item-value">
							<span class="indicator-value-counter" data-toggle="counter"
								data-decimals="1" data-end="17.9">${totalquestion }</span>
							<div class="indicator-value-title">문제 수</div>
						</div>
					</div>
					<div class="indicator-item">
						<div class="indicator-item-icon">
							<div class="icon">
								<span class="s7-cart"></span>
							</div>
						</div>
						<div class="indicator-item-value">
							<span class="indicator-value-counter" data-toggle="counter"
								data-decimals="1" data-end="17.9"><c:out
									value=" ${solveNum}" /></span>
							<div class="indicator-value-title">내가 푼 문제수</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%-- 	<!-- 채팅방리스트 	 -->
			
			<div class="row">
				<div class="col-12">
					<div class="project-list">
						<div class="project-list-title">기출 문제
							<button class="btn btn-space btn-outline-primary btn-space btn-location" onclick="location.href='${path}/ChatListPage'">더보기</button>
												</div>
												<!-- 1번째 채팅방 -->
												<!-- "${not empty chatrooms}"는 chatrooms 변수가 비어 있지 않으면(즉, null이 아니면) 블록 내의 내용을 실행하라는 조건을 나타냅니다. 이것은 chatrooms 변수에 값이 있는 경우 해당 블록 내의 HTML을 렌더링합니다. 만약 chatrooms 변수가 비어 있거나 null인 경우에는 이 블록을 건너뜁니다. -->
												<c:if test="${not empty chatrooms}"> 
												
    <c:forEach items="${chatrooms}" var="q1">
        <div class="project-item">
            <div class="project-item-title">
                <span class="name"><b><c:out value="${q1.q_title}" /></b></span>
            </div>
            <div class="project-item-user">
                <div class="user-info">
                    <span class="name">현재 인원 수: <c:out value="${chatroom.statusMem}" /></span>
                    <span class="position description">총 인원수: <c:out value="${chatroom.allowMem}" /></span>
                </div>
            </div>
            <div class="project-item-state">
                <span class="name">언어: <c:out value="${chatroom.language}" /></span>
                <span class="position description">방장: <c:out value="${chatroom.id}" /></span>
            </div>
            
            <div class="project-item-date">
                <span class="date">개설시간: <fmt:formatDate value="${chatroom.createTime}" pattern="yyyy-MM-dd" /></span>
            </div>
            <div class="mt-2 mb-1">
                <button class="btn btn-rounded btn-space btn-secondary">입장하기</button>
                <p class="animation_best">추천!!!👍</p>
            </div>
        </div>
    </c:forEach>
</c:if>

<c:if test="${empty chatrooms}">
    <!-- 처리할 내용이 없는 경우 -->
    <div class="no-chatrooms">
        <p>No chat rooms available.</p>
    </div>
</c:if> --%>


		<!-- 			<!-- 문제 풀이 -->


		<div class="row">
			<div class="col-12">
				<div class="project-list">
					<div class="project-list-title">문제리스트</div>
					<!-- 1번문제 -->
					<div class="project-item">
						<div class="project-item-title">
							<span class="name"><b>${firstQuestion.q_title }</b></span>
						</div>
						<div class="project-item-user">
							<div class="user-info">
								<span class="name">정답률 :${firstQuestion.q_anwserpercent }%</span>
							</div>
						</div>
						<div class="project-item-state">
							<span class="name">언어 : ${firstQuestion.q_language }</span>
						</div>
						<div class="project-item-date">
							<span class="name">레벨 : ${firstQuestion.q_level }
								<p></p>
							</span>
						</div>
						<div class="mt-2 mb-1">
							<button class="btn btn-rounded btn-space btn-secondary"
								onclick="location.href='${path}/playCoding?q_num=${firstQuestion.q_num}'">입장하기</button>
		                <p class="animation_best">추천!!!👍</p>
						</div>
		
					</div>
					<!-- 2번문제 -->
					<div class="project-item">
							<div class="project-item-title">
								<span class="name"><b>${secondQuestion.q_title }</b></span>
							</div>
							<div class="project-item-user">
								<div class="user-info">
									<span class="name">정답률 :${secondQuestion.q_anwserpercent }%</span>
								</div>
							</div>
							<div class="project-item-state">
								<span class="name">언어 : ${secondQuestion.q_language }</span>
							</div>
							<div class="project-item-date">
								<span class="name">레벨 : ${secondQuestion.q_level }<p></p></span>
							</div>
							<div class="mt-2 mb-1">
								<button class="btn btn-rounded btn-space btn-secondary" onclick="location.href='${path}/playCoding?q_num=${secondQuestion.q_num}'">입장하기</button>
							</div>
						</div>
						<!-- 3번문제 -->
						<div class="project-item">
							<div class="project-item-title">
								<span class="name"><b>${thirdQuestion.q_title }</b></span>
							</div>
							<div class="project-item-user">
								<div class="user-info">
									<span class="name">정답률 :${thirdQuestion.q_anwserpercent }%</span>
								</div>
							</div>
							<div class="project-item-state">
								<span class="name">언어 : ${thirdQuestion.q_language }</span>
							</div>
							<div class="project-item-date">
								<span class="name">레벨 : ${thirdQuestion.q_level }<p></p></span>
							</div>
							<div class="mt-2 mb-1">
								<button class="btn btn-rounded btn-space btn-secondary" onclick="location.href='${path}/playCoding?q_num=${thirdQuestion.q_num}'">입장하기</button>
							</div>
						</div>
						<!-- 4번문제 -->
						<div class="project-item">
							<div class="project-item-title">
								<span class="name"><b>${fourthQuestion.q_title }</b></span>
							</div>
							<div class="project-item-user">
								<div class="user-info">
									<span class="name">정답률 :${fourthQuestion.q_anwserpercent }%</span>
								</div>
							</div>
							<div class="project-item-state">
								<span class="name">언어 : ${fourthQuestion.q_language }</span>
							</div>
							<div class="project-item-date">
								<span class="name">레벨 : ${fourthQuestion.q_level }<p></p></span>
							</div>
							<div class="mt-2 mb-1">
								<button class="btn btn-rounded btn-space btn-secondary" onclick="location.href='${path}/playCoding?q_num=${fourthQuestion.q_num}'">입장하기</button>
							</div>
						</div>
						<!-- 5번 문제 -->
						<div class="project-item">
							<div class="project-item-title">
								<span class="name"><b>${fifthQuestion.q_title }</b></span>
							</div>
							<div class="project-item-user">
								<div class="user-info">
									<span class="name">정답률 :${fifthQuestion.q_anwserpercent }%</span>
								</div>
							</div>
							<div class="project-item-state">
								<span class="name">언어 : ${fifthQuestion.q_language }</span>
							</div>
							<div class="project-item-date">
								<span class="name">레벨 : ${fifthQuestion.q_level }<p></p></span>
							</div>
							<div class="mt-2 mb-1">
								<button class="btn btn-rounded btn-space btn-secondary" onclick="location.href='${path}/playCoding?q_num=${fifthQuestion.q_num}'">입장하기</button>
							</div>
						</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
      $(document).ready(function(){
      	//-initialize the javascript
      	App.init();
      	App.charts();
      });
    </script>
		<script type="text/javascript">
    var context = document
    .getElementById('myChart')
    .getContext('2d');
var myChart = new Chart(context, {
    type: 'bar', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: [
            //x 축
            'JAVA','C','C++','C#','PYTHON'
        ],
        datasets: [
            { //데이터
                label: '언어 선호도', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                    43,19,23,25,32 //x축 label에 대응되는 데이터 값
                ],
                backgroundColor: [
                    //색상
                	'rgba(44, 193, 133, 1)',
                	'rgba(44, 193, 133, 1)',
                	'rgba(44, 193, 133, 1)',
                	'rgba(44, 193, 133, 1)',
                	'rgba(44, 193, 133, 1)'
                    ],
                borderColor: [
                    //경계선 색상
                	'rgba(75, 192, 192, 0.8)',
                	'rgba(75, 192, 192, 0.8)',
                	'rgba(75, 192, 192, 0.8)',
                	'rgba(75, 192, 192, 0.8)',
                	'rgba(75, 192, 192, 0.8)',
                	'rgba(75, 192, 192, 0.8)'
                ],
                borderWidth: 1 //경계선 굵기
            }/* ,
            {
                label: 'test2',
                fill: false,
                data: [
                    8, 34, 12, 24
                ],
                backgroundColor: 'rgb(157, 109, 12)',
                borderColor: 'rgb(157, 109, 12)'
            } */
        ]
    },
    options: {
        scales: {
            yAxes: [
                {
                    ticks: {
                        beginAtZero: true
                    }
                }
            ]
        }
    }
});
    </script>
    </div>
</body>
</html>