<%@page import="util.JSFunction"%>
<%@ page import="chatvisitcount.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String visit_num = request.getParameter("visit_num");
	String roomTitle = request.getParameter("roomTitle");
	ChatVisitDTO dto = new ChatVisitDTO();
	dto.setId((String)session.getAttribute("UserId"));
	//dto.setVisit_num(visit_num);
	dto.setRoomTitle(roomTitle);
	ChatVisitDAO dao = new ChatVisitDAO(application);
	int result = dao.insertVisit(dto);
	dao.close();
	if(result==1){
		response.sendRedirect("ChatRoomPage.jsp?roomTitle="+URLEncoder.encode(dto.getRoomTitle(), "UTF-8"));
	}
	else{
		JSFunction.alertBack("방 입장에 실패했습니다.", out);
	}
%>