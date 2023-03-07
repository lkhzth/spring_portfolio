<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp" %>
<script src="${contextPath}/resources/js/slide.js"></script>
	<div class="one-time">
		<div><img src="${contextPath}/resources/images/main01.png"></div>
		<div><img src="${contextPath}/resources/images/main02.png"></div>
	</div>

<div class="container">
	<h1>인덱스</h1>
	<div>
		<spring:message code="main.greeting" arguments="${name},${welcome}"/>
	</div>
	
</div>

<%@ include file="layout/footer.jsp" %>
