<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String currentPassword = request.getParameter("currentPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

// TODO: 비밀번호 일치 여부 확인 및 업데이트 로직 구현

if (newPassword.equals(confirmPassword)) {
    // 비밀번호가 일치할 경우, 업데이트 쿼리문 실행
    String userId = (String) session.getAttribute("UserId");

    MemberDao dao = new MemberDao(application);
    int result = dao.updatePassword(userId, newPassword);

    if (result == 1) {
        response.sendRedirect("PasswordChangeSuccess.jsp");
    } else {
        System.out.println("Exception[updatePassword]: Update failed");
        // 업데이트 실패 시, 예외 처리 또는 다른 처리 수행
    }
} else {
    // 비밀번호가 일치하지 않을 경우, 경고 메시지 출력
    response.sendRedirect("ChangePasswordForm.jsp");
}
%>
