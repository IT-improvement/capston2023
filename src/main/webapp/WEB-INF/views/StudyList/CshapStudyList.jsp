<%@page import="studyList.StudyListDTO"%>
<%@page import="studyList.StudyListDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <!-- 여기서 부터 배너 -->
<body>
	<nav class="navbar navbar-expand navbar-dark mai-top-header">
		<div class="container">
			<a class="navbar-brand" href="#"></a>
			<ul class="nav navbar-nav mai-top-nav">
				<li class="nav-item"><a class="nav-link" href="index.html">메인</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
					role="button" aria-expanded="false">Services<span
						class="angle-down s7-angle-down"></span></a>
					<div class="dropdown-menu" role="menu">
						<a class="dropdown-item" href="#">Information</a><a
							class="dropdown-item" href="#">Company</a><a
							class="dropdown-item" href="#">Documentation</a><a
							class="dropdown-item" href="#">API Settings</a><a
							class="dropdown-item" href="#">Export Info</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">Support</a></li>
			</ul>
			<ul class="navbar-nav float-lg-right mai-icons-nav">
				<li class="dropdown nav-item mai-messages"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
					role="button" aria-expanded="false"><span
						class="icon s7-comment"></span></a>
					<ul class="dropdown-menu">
						<li>
							<div class="title">Messages</div>
							<div class="mai-scroller-messages">
								<div class="content">
									<ul>
										<li><a href="#">
												<div class="img">
													<img src="assets/img/avatars/img1.jpg" alt="avatar">
												</div>
												<div class="content">
													<span class="date">16 Sept</span><span class="name">Victor
														Jara</span><span class="desc">The song that has been
														brave, will always be the new song.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="img">
													<img src="assets/img/avatars/img2.jpg" alt="Avatar">
												</div>
												<div class="content">
													<span class="date">4 Sept</span><span class="name">Gustavo
														Cerati</span><span class="desc">You will see me fly across
														the city of fury where no one knows of me.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="img">
													<img src="assets/img/avatars/img3.jpg" alt="Avatar">
												</div>
												<div class="content">
													<span class="date">13 Aug</span><span class="name">Jaime
														Garzón</span><span class="desc">Now everything came back
														to the abnormality.</span>
												</div>
										</a></li>
										<li><a href="#">
												<div class="img">
													<img src="assets/img/avatars/img4.jpg" alt="Avatar">
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
				<li class="dropdown nav-item mai-settings"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
					role="button" aria-expanded="false"><span
						class="icon s7-settings"></span></a>
					<ul class="dropdown-menu">
						<li>
							<div class="title">Settings</div>
							<div class="content">
								<ul>
									<li><span>Enable Notifications</span>
										<div class="float-right">
											<div class="switch-button switch-button-sm">
												<input type="checkbox" checked="" name="check" id="switch1"><span>
													<label for="switch1"></label>
												</span>
											</div>
										</div></li>
									<li><span>Auto Commit</span>
										<div class="float-right">
											<div class="switch-button switch-button-sm">
												<input type="checkbox" checked="" name="check2" id="switch2"><span>
													<label for="switch2"></label>
												</span>
											</div>
										</div></li>
									<li><span>Sidebar</span>
										<div class="float-right">
											<div class="switch-button switch-button-sm">
												<input type="checkbox" name="check3" id="switch3"><span>
													<label for="switch3"></label>
												</span>
											</div>
										</div></li>
									<li><span>Full-width Layout</span>
										<div class="float-right">
											<div class="switch-button switch-button-sm">
												<input type="checkbox" checked="" name="check4" id="switch4"><span>
													<label for="switch4"></label>
												</span>
											</div>
										</div></li>
								</ul>
							</div>
						</li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav float-lg-right mai-user-nav">
				<li class="dropdown nav-item"><a
					class="dropdown-toggle nav-link" href="#" data-toggle="dropdown"
					role="button" aria-expanded="false"><img
						src="assets/img/avatar.jpg" alt="Avatar"><span
						class="user-name">Violeta Parra</span><span
						class="angle-down s7-angle-down"></span></a>
					<div class="dropdown-menu" role="menu">
						<a class="dropdown-item" href="#"><span class="icon s7-home"></span>My
							Account</a><a class="dropdown-item" href="pages-profile.html"><span
							class="icon s7-user"></span>Profile</a><a class="dropdown-item"
							href="#"><span class="icon s7-cash"></span>Billing</a><a
							class="dropdown-item" href="#"><span class="icon s7-tools"></span>Settings</a><a
							class="dropdown-item" href="pages-login.html"><span
							class="icon s7-power"></span>Log Out</a>
					</div></li>
			</ul>
		</div>
	</nav>
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
					<div class="navbar-collapse collapse mai-nav-tabs" id="mai-navbar-collapse">
						<ul class="nav navbar-nav">
						 <li class="nav-item parent open"><a class="nav-link" href="#" role="button" aria-expanded="false"><span class="icon s7-home">
						 </span><span>메인페이지</span></a>
                                      <ul class="mai-nav-tabs-sub mai-sub-nav nav">
                                      <li class="nav-item"><a class="nav-link active" href="index.html"><span class="icon s7-monitor"></span>
                                      <span class="name">메인페이지</span></a>
                                      </ul>
                                    </li>
							<li class="nav-item parent">
								<a class="nav-link" href="#" role="button" aria-expanded="false">
								<span class="icon s7-diamond"></span><span>코딩테스트</span></a>
								<ul class="mai-nav-tabs-sub mai-sub-nav nav">
									<li class="nav-item dropdown parent">
									<a class="nav-link" href="ui-elements.html" data-toggle="dropdown">
									<span class="icon s7-diamond"></span>
									<span class="name">문제</span></a>
										<div class="dropdown-menu mai-sub-nav" role="menu">
											<a class="dropdown-item" href="">JAVA</a> <a
												class="dropdown-item" href="">C언어</a> <a
												class="dropdown-item" href="">PYTHON</a> <a
												class="dropdown-item" href="">HTML</a> <a
												class="dropdown-item" href="">JSP</a> <a
												class="dropdown-item" href="">JAVASCRIPT</a> <a
												class="dropdown-item" href="">MYSQL</a>
										</div></li>
									<!-- 타임어택 메뉴에 난이도선택/시간선택/언어선택 뭐 넣을지 고민 -->
									<li class="nav-item dropdown parent"><a class="nav-link"
										href="ui-elements.html" data-toggle="dropdown"><span
											class="icon s7-diamond"></span><span class="name">타임어택</span></a>
										<div class="dropdown-menu mai-sub-nav" role="menu">
											<a class="dropdown-item" href="">JAVA</a> <a
												class="dropdown-item" href="">C언어</a> <a
												class="dropdown-item" href="">PYTHON</a> <a
												class="dropdown-item" href="">HTML</a> <a
												class="dropdown-item" href="">JSP</a> <a
												class="dropdown-item" href="">JAVASCRIPT</a> <a
												class="dropdown-item" href="">MYSQL</a>
										</div></li>
								</ul></li>
							<li class="nav-item parent"><a class="nav-link" href="#"
								role="button" aria-expanded="false"><span
									class="icon s7-rocket"></span><span>강의자료</span></a>
								<ul class="mai-nav-tabs-sub mai-sub-nav nav">
									<li class="nav-item dropdown parent"><a class="nav-link"
										href="ui-elements.html" data-toggle="dropdown"><span
											class="icon s7-diamond"></span>
											<span class="name">언어선택</span></a>
										<div class="dropdown-menu mai-sub-nav" role="menu">
											<a class="dropdown-item" href="">JAVA</a> <a
												class="dropdown-item" href="">C언어</a> <a
												class="dropdown-item" href="">PYTHON</a> <a
												class="dropdown-item" href="">HTML</a> <a
												class="dropdown-item" href="">JSP</a> <a
												class="dropdown-item" href="">JAVASCRIPT</a> <a
												class="dropdown-item" href="">MYSQL</a>
										</div></li>
										 <li class="nav-item">
										 <a class="nav-link" href="">
										 <span class="icon s7-diamond"></span>
										 <span class="name">강의동영상</span></a>
                                                  </li>
								</ul></li>
							<li class="nav-item parent"><a class="nav-link" href="#"
								role="button" aria-expanded="false"><span
									class="icon s7-rocket"></span><span>채팅방</span></a>
								<ul class="mai-nav-tabs-sub mai-sub-nav nav">
								</ul></li>
							<li class="nav-item parent"><a class="nav-link" href="#"
								role="button" aria-expanded="false"><span
									class="icon s7-rocket"></span><span>내정보</span></a>
								<ul class="mai-nav-tabs-sub mai-sub-nav nav">
								</ul></li>
						</ul>
					</div>
				</nav>
				<div class="search">
					<input type="text" placeholder="Search..." name="q"><span
						class="s7-search"></span>
				</div>
			</div>
		</nav>
      
      
      
      <!-- 자료 리스트 -->
      <%
      //DAO를 생성해 DB 연결
      StudyListDAO dao = new StudyListDAO(application);
															
	  //게시물 목록 받기
	  String language = "C#";
	  List<StudyListDTO> studylist = dao.Language(language);
      %>
      <div class="main-content container">
      <form name="moveform">
      <div class="movePage">
		<div class="title">페이지 이동하기 </div>
		  
     <div class="left">
		 <input type="radio" name="languageChecked" value="JAVA"> JAVA<br>
		 <input type="radio" name="languageChecked" value="C++"> C++<br>
	</div>
	<div class="right">
		<input type="radio" name="languageChecked" value="C"> C<br>
		<input type="radio" name="languageChecked" value="Cshap"> C#<br>
	</div>
	<button type="button" class="movebtn" onclick="movePage()">선택강의자료 페이지로 이동하기</button>
</div>
</form>
       
          <div class="col-sm-12">
            <div class="card card-default card-table">
              <div class="card-header">C# 공부 리스트
           
              </div>
              <div class="card-body">
                <table class="table table-striped table-hover" id="table1">
                  <thead>
                    <tr>
    		<th width = "5%"> 번호 </th>
    		<th width = "30%"> 참고 자료제목 </th>
    		<th width = "5%"> 작성일 </th>
    		<th width = "5%"> 조회수 </th>
    				</tr>
                  </thead>
                  <tbody>
                  <% if(studylist.isEmpty()){%>
                  <tr>
                  <td colspan="4" align="center">
                  	등록된 자료가 없습니다.
                  </td>
                  </tr>
                  <% }else{
                	  for(StudyListDTO list : studylist){
                	  %>
                	  <tr class="">
                      <td class="center"><%=list.getStudy_num() %></td>
                      <td class="center"><a href=""><%=list.getTitle() %></a></td>
                      <td class="center"><%=list.getCreateTime() %></td>
                      <td class="center"><%=list.getVisitCount() %></td>
                    </tr>
                	<% }}%>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        
     
    </div>
    
    <script type="text/javascript">
      $(document).ready(function(){
      	//-initialize the javascript
      	App.init();
      	App.dataTables();
      });
    </script>
  </body>
</html>