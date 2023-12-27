<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<link rel="stylesheet" href= "${path}/resources/assets/css/list.css"/>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0"/>
	<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${path}/resources/assets/css/app.css"
	type="text/css" />
<link rel="stylesheet" href="${path}/resources/assets/css/list.css" />
	<head>
	    <title>메모장</title>
	  </head>
	  <body>
	    
    
    <h2 style="text-align: center; font-size: 50px;">${question.q_title}</h2>
    <h3 style="text-align: center; font-size: 20px;">문제 번호: ${question.q_info}</h3>

    <style>
        iframe {
            height: 70vh; /* 70% of the viewport height */
            width: 100%; /* Full width */
            border: none; /* Remove iframe border */
        }
    </style>

  
<iframe src=https://www.programiz.com/java-programming/online-compiler id="iframe1"></iframe>	  
	     <div class="answer-button">
                    <button onclick="history.back()" class="btn btn-danger">뒤로가기</button>
    </div>
	    

	  </body>

	</html>