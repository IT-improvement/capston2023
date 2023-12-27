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
<jsp:include page="../menu.jsp"></jsp:include>
      
      
      
      <!-- 자료 리스트 -->
      <%
      //DAO를 생성해 DB 연결
      StudyListDAO dao = new StudyListDAO(application);
															
	  //게시물 목록 받기
	  String language = "C++";
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
              <div class="card-header">C++ 공부 리스트
           
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