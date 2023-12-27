
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@ page import="member.MemberDTO"%>
<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
 // 로그인 폼으로부터 받은 아이디와 패스워드
 	String userId = request.getParameter("id");
 	String userPwd = request.getParameter("pwd");
 	Timestamp date = new Timestamp(System.currentTimeMillis());
 	// web.xml에서 가져온 데이터베이스 연결 정보
 	
 	
 	// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
 	MemberDao dao = new MemberDao(application);
 	MemberDTO dto = dao.getMemberDTO(userId, userPwd);
 	
 	// 로그인 성공 여부에 따른 처리
 	if(dto != null){
 		MemberDTO dto2 = new MemberDTO();
 		dto2.setLogDate(date);
 		dto2.setId(userId);
 		int result = dao.insertLog(dto2);
 		session.setAttribute("UserId", dto.getId());
 		session.setAttribute("UserName", dto.getUserName());
 		response.sendRedirect("main_page.jsp");
 	}else{
 		request.setAttribute("LoginErrMsg", "로그인 오류입니다!");
 %>
		<script>
		alert('로그인 오류입니다.');
		location.href="pages-login.jsp";
		</script>		]
		
	<%	}%>


