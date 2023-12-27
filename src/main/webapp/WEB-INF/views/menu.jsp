<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<c:set var="authenticatedMemberId" value="${sessionScope.authenticatedMemberId}" />
<!-- 여기서 authenticatedMemberId는 MemberController에서 세션에 저장한 키입니다. -->
<!-- 최상위메뉴버 -->
	<nav class="navbar navbar-expand navbar-dark mai-top-header">
		<div class="container">
			<a class="navbar-brand" href=""><img src="${path}/resources/assets/img/capston_logo_ex3.jpg" class="logo_img" alt="꿀벌코딩"></a>
			
			<ul class="nav navbar-nav mai-top-nav">
				<li class="nav-item"><a class="nav-link" href="../main/main_page.jsp">메인</a></li>
				<li class="nav-item"><a class="nav-link" href="../main/main_about.jsp">About</a></li>
			</ul>
			<ul class="navbar-nav float-lg-right mai-icons-nav">
				<li class="dropdown nav-item mai-messages"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
					role="button" aria-expanded="false"><span
						class="icon s7-comment"></span></a>
					<ul class="dropdown-menu">
						<li>
							<div class="title">꿀벌코딩</div>
							<div class="mai-scroller-messages">
								<div class="content">
									<ul>
										<li><a href="#">
												<div class="img">
													<img src="${path}/resources/assets/img/avatars/img1.jpg" alt="avatar">
												</div>
												<div class="content">
													<span class="date">16 Sept</span><span class="name">Victor
														Jara</span><span class="desc">The song that has been
														brave, will always be the new song.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="img">
													<img src="${path}/resources/assets/img/avatars/img2.jpg" alt="Avatar">
												</div>
												<div class="content">
													<span class="date">4 Sept</span><span class="name">Gustavo
														Cerati</span><span class="desc">You will see me fly across
														the city of fury where no one knows of me.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="img">
													<img src="${path}/resources/assets/img/avatars/img3.jpg" alt="Avatar">
												</div>
												<div class="content">
													<span class="date">13 Aug</span><span class="name">Jaime
														Garzón</span><span class="desc">Now everything came back
														to the abnormality.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="img">
													<img src="${path}/resources/assets/img/avatars/img4.jpg" alt="Avatar">
												</div>
												<div class="content">
													<span class="date">13 Aug</span><span class="name">Allen
														Collins</span><span class="desc">Things just couldn't even
														be the same 'Cause I'm as free as a bird now.</span>
												</div>
										</a></li>
									</ul>
								</div>
							</div>
							<div class="footer">
								<a href="#">View all messages</a>
							</div>
						</li>
					</ul></li>
				<li class="dropdown nav-item mai-notifications"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
					role="button" aria-expanded="false"><span class="icon s7-bell"></span><span
						class="indicator"></span></a>
					<ul class="dropdown-menu">
						<li>
							<div class="title">Notifications</div>
							<div class="mai-scroller-notifications">
								<div class="content">
									<ul>
										<li><a href="#">
												<div class="icon">
													<span class="s7-check"></span>
												</div>
												<div class="content">
													<span class="desc">This is a new message for my dear
														friend <strong>Rob</strong>.
													</span><span class="date">10 minutes ago</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="icon">
													<span class="s7-add-user"></span>
												</div>
												<div class="content">
													<span class="desc">You have a new fiend request
														pending from <strong>John Doe</strong>.
													</span><span class="date">2 days ago</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="icon">
													<span class="s7-graph1"></span>
												</div>
												<div class="content">
													<span class="desc">Your site visits have increased <strong>15.5%</strong>
														more since the last week.
													</span><span class="date">2 hours ago</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="icon">
													<span class="s7-check"></span>
												</div>
												<div class="content">
													<span class="desc">This is a new message for my dear
														friend <strong>Rob</strong>.
													</span><span class="date">10 minutes ago</span>
												</div>
										</a></li>
									</ul>
								</div>
							</div>
							<div class="footer">
								<a href="#">View all notifications</a>
							</div>
						</li>
					</ul></li>
				
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
							<a class="dropdown-item" href="${path}/myprofile"><span
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
									<!-- 타임어택 메뉴에 난이도선택/시간선택/언어선택 뭐 넣을지 고민 -->
									<li class="nav-item"><a class="nav-link" href="${path}/pastQusetionList"> <span
											class="icon s7-diamond"></span> <span class="name">기업
												기출문제</span></a></li>
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
									<li class="nav-item"><a class="nav-link" href=""> <span
											class="icon s7-diamond"></span> <span class="name">QnA</span></a>
									</li>
								</ul></li>
						</ul>
					</div>
				</nav>
			</div>
		</nav>
		
		</div>