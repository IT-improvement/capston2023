<%@page import="video.VideoDTO"%>
<%@page import="video.VideoDAO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<jsp:include page="../menu.jsp"></jsp:include>      
      <!-- 자료 리스트 -->
      <%
      //DAO를 생성해 DB 연결
      VideoDAO dao = new VideoDAO(application);
															
	  //게시물 목록 받기
	  String language = "C";
	  List<VideoDTO> videolist = dao.Language(language);
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
	<button type="button" class="movebtn" onclick="moveVideoPage()">선택강의자료 페이지로 이동하기</button>
</div>
</form>
       
          <div class="col-sm-12">
            <div class="card card-default card-table">
              <div class="card-header">C 동영상
           
              </div>
              <div class="card-body">
                <table class="table table-striped table-hover" id="table1">
                  <thead>
                    <tr>
    		<th width = "5%"> 번호 </th>
    		<th width = "30%"> 제목 </th>
    		<th width = "10%"> 조회수 </th>
    				</tr>
                  </thead>
                  <tbody>
                  <% if(videolist.isEmpty()){%>
                  <tr>
                  <td colspan="3" align="center">
                  	등록된 자료가 없습니다.
                  </td>
                  </tr>
                  <% }else{
                	  for(VideoDTO list : videolist){
                	  %>
                	  <tr class="">
                      <td class="center"><%=list.getNum() %></td>
                      <td class="center"><a href="${list.url }"><%=list.getvTitle() %></a></td>
                      <td class="center"><%=list.getPlayNum() %></td>
                    </tr>
                	<% }}%>
                  </tbody>
                </table>
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