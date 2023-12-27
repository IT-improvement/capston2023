<%@page import="chatvisitcount.ChatVisitDTO"%>
<%@page import="chatvisitcount.ChatVisitDAO"%>
<%@ page import="java.util.*" %>
<%@ page import="chatlist.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String roomTitle = request.getParameter("roomTitle");
	String visit_num = request.getParameter("visit_num");
	ChatVisitDAO dao = new ChatVisitDAO(application);
	ChatVisitDTO dto = dao.selectVisit(roomTitle);
%>
<!Doctype html>
<html>
  <!--<script>
	function deletePost() {
		var confirmed = confrim("정말로 나가시겠습니까?");
		if(confirmed){
			var form = document.chatRoomFrm;
			form.method = "post";
			form.action = "roomOutProcess.jsp";
			form.submit();
		}
	}
</script>  -->
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/chatRoomEX2.css">
  </head>
  <body>
  <form name="chatRoomFrm">
    <button class="btn btn-dark" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">메뉴</button>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample"      aria-labelledby="offcanvasExampleLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasExampleLabel">메뉴</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <div>
          언어 선택
        </div>
        <div class="dropdown mt-3">
          <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
            언어 종류
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">JAVA</a></li>
            <li><a class="dropdown-item" href="#">C</a></li>
            <li><a class="dropdown-item" href="#">PYTHON</a></li>
          </ul>
        </div>
      </div>
    </div>
    <h1><%=dto.getRoomTitle() %></h1>
    <div class="container-fluid">
      <div class="row btnFild">
        <div class="col comfileBtnFild">
          <button type="button" class="btn btn-success comfileBtn">컴파일</button>
        </div>
        <div class="col chatLanguagefild">
          언어 : <%=dto.getLanguage() %> 
        </div>
        <div class="col chatNamefild">
         방장 : <%=dto.getId() %>
        </div>
        <div class="col roomOutBtnFild">
          <button type="button" class="btn btn-success roomOutBtn" onclick="location.href='roomOutProcess.jsp?id=<%=dto.getId() %>'">나가기</button>
        </div>
      </div>
      <div class="row bigFild">
        <div class="col leftFild">
          <text class="form-control" id="codeTxt"></text>
        </div>
        <div class="col rightFild">
          <text class="form-control" id="comfileTxt"></text>
          <div class="row userFild">
            <div class="col user1Fild">
              <figure class="figure user1fig">
                <img src="https://via.placeholder.com/40" class="figure-img img-fluid rounded" alt="...">
                <figcaption class="figure-caption text-end"></figcaption>
              </figure>
              	<%=dto.getId() %>
            </div>
					<div class="col user2Fild">
              <figure class="figure user2fig">
                <img src="https://via.placeholder.com/40" class="figure-img img-fluid rounded" alt="...">
                <figcaption class="figure-caption text-end"></figcaption>
              </figure>
              	
            </div>
          </div>
          <div class="row">
            <div class="col user3Fild">
              <figure class="figure user3fig">
                <img src="https://via.placeholder.com/40" class="figure-img img-fluid rounded" alt="...">
                <figcaption class="figure-caption text-end"></figcaption>
              </figure>
              	
            </div>
            <div class="col user4Fild">
              <figure class="figure user4fig">
                <img src="https://via.placeholder.com/40" class="figure-img img-fluid rounded" alt="...">
                <figcaption class="figure-caption text-end"></figcaption>
              </figure>
              	
            </div>
          <div class="row chatFild">
            <div class="col chatOutputFild">
              <text class="form-control" id="chatOutputTxt"></text>
            </div>
          </div>
          <div class="row chatBtnFild">
            <div class="col-10 chatInputFild">
              <input type="text" class="form-control" id="chatInputTxt">
            </div>
            <div class="col-2 chatSendFild">
              <button type="button" class="btn btn-secondary chatSendBtn">전송</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
		</form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>