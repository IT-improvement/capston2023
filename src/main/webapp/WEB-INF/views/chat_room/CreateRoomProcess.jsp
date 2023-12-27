<%@page import="chatvisitcount.ChatVisitDAO"%>
<%@page import="chatvisitcount.ChatVisitDTO"%>
<%@page import="util.JSFunction"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="chatlist.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String roomTitle = request.getParameter("title");
	String language = request.getParameter("language");
	String roomPwd = request.getParameter("roomPwd");
	String visit_num = request.getParameter("visit_num");
	
	ChatListDTO dto = new ChatListDTO();
	ChatVisitDTO dto2 = new ChatVisitDTO();
	dto.setRoomTitle(roomTitle);
	dto.setLanguage(language);
	dto.setRoomPwd(roomPwd);
	dto.setId((String)session.getAttribute("UserId"));
	dto2.setRoomTitle(roomTitle);
	dto2.setId((String)session.getAttribute("UserId"));
	
	ChatListDAO dao = new ChatListDAO(application);
	ChatVisitDAO dao2 = new ChatVisitDAO(application);
	int iResult = dao.insertWrite(dto);
	dao.close();
	iResult = dao2.insertVisit(dto2);
	dto2 = dao2.selectVisit(roomTitle);
	if(iResult == 1){
		response.sendRedirect("ChatRoomPage.jsp?roomTitle="+URLEncoder.encode(dto2.getRoomTitle(), "UTF-8"));
	}
	else{
		JSFunction.alertBack("방생성에 실패하였습니다.", out);
	}
%>