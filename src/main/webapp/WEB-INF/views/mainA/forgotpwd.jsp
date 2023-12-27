<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String question = request.getParameter("question");
String answer = request.getParameter("answer");
MemberDao dao = new MemberDao(application);
MemberDTO dto = dao.findpwd(id, question, answer);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<br>
	<b><font size="4" color="gray">비밀번호 찾기</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<div id="msg"></div>
		<br>
		<input id="cancelBtn" type="button" value="닫기" onclick="window.close()">
	</div>
</body>
<%
if(dto.getPwd() != null){
	%>
	<script>
	document.getElementById("msg").innerHTML = "<%=dto.getPwd()%>";
	</script>
<%
}else{
	%>
	<script>
	document.getElementById("msg").innerHTML ="입력하신 아이디의 정보가 없습니다.";
	</script>
<%
}
%>
</html>