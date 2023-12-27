<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
   String userId = (String) session.getAttribute("UserId");
       String currentPassword = request.getParameter("currentPassword");
       
       MemberDao dao = new MemberDao(application);
       MemberDTO dto = dao.getPasswordChangeDTO(userId, currentPassword);
       
       if (dto != null && dto.getPwd().equals(currentPassword)) {
           // 비밀번호가 일치할 경우, 비밀번호 변경 가능한 창을 띄우는 페이지로 이동합니다.
           response.sendRedirect("ChangePasswordForm.jsp?currentPassword=" + dto.getPwd());
       } else {
           // 비밀번호가 일치하지 않을 경우, 경고 창을 띄우는 페이지로 이동합니다.
           response.sendRedirect("PwdChangeform.jsp");
       }
   %>
    



    