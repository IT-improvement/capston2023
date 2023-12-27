<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/assers/css/openchat.css" />
<link rel="stylesheet" href="${path}/resources/assets/css/app.css"
	type="text/css" />
<link rel="stylesheet" href="${path}/resources/assets/css/list.css" />
</head>
<body>
<style>
        iframe {
            height: 90vh; /* 70% of the viewport height */
            width: 100%; /* Full width */
            border: none; /* Remove iframe border */
        }
</style>
<iframe src="http://localhost:8080/" id="iframe1"></iframe>
                    <button onclick="history.back()" class="btn btn-danger">뒤로가기</button>
</body>
</html>