<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>	
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${path}/resources/assets/img/favicon.png">
    <title>코딩포차</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/lib/stroke-7/style.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css"/>
    <link rel="stylesheet" href="${path}/resources/assets/css/app.css" type="text/css"/>
    <link rel="stylesheet" href="${path}/resources/assets/css/test2.css">
    <jsp:include page="../import/link.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="../menu.jsp"></jsp:include>
    <div class="main-content container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card card-default card-table">
                    <div class="card-header">음성 채팅 서버
                        <button type="button" class="btn btn-success createRoomBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">방 생성</button>
                        <!-- 방 생성 모달 -->
                        <form name="createFrm" method="post" action="CreateRoomProcess.jsp" onsubmit="return ">
                            <!-- ... (생략) ... -->
                        </form>
                        <div class="tools"></div>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-hover" id="table1">
                            <thead>
                                <tr>
                                    <th>방 이름</th>
                                    <th>생성자</th>
                                    <th>참여 인원</th>
                                    <th>개설시간</th>
                                    <th>사용 언어</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty chatList}">
                                    <tr>
                                        <td colspan="5" align="center">
                                            현재 새로 생성된 방이 없습니다.
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="chat" items="${chatList}">
                                    <tr class="odd gradeX">
                                        <td><a href='VisitRoomProcess.jsp?roomTitle=${URLEncoder.encode(chat.roomTitle, "UTF-8")}' target="_blank">${chat.roomTitle}</a></td>
                                        <td>${chat.id}</td>
                                        <td>${chat.statusMem}/${chat.allowMem}</td>
                                        <td class="center">${chat.createTime}</td>
                                        <td class="center">${chat.language}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ... (생략) ... -->
</body>
</html>