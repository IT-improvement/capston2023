<%@page import="util.JSFunction"%>
<%@ page import="chatvisitcount.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String visit_num = request.getParameter("visit_num");
	ChatVisitDAO dao = new ChatVisitDAO(application);
	ChatVisitDTO dto = new ChatVisitDTO();
	dto.setVisit_num(visit_num);
	dto = dao.selectVisit(visit_num);
	String sessionId = (String)session.getAttribute("UserId");
	int delResult = dao.deleteVisit(sessionId);	
	JSFunction.alertLocation("방에서 나갔습니다.", "ChatListPage.jsp", out);
%>