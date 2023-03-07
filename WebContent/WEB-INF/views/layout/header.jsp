<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
	.lh{vertical-align: center}
</style>

<!-- 슬라이더 -->
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<script>const contextPath = '${contextPath}'</script>

<script src="${contextPath}/resources/js/main.js"></script>
<script src="${contextPath}/resources/js/list.js"></script>
<script src="${contextPath}/resources/js/detail.js"></script>
<script src="${contextPath}/resources/js/reply.js"></script>

</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light">
		  <ul class="navbar-nav">
		    <li class="nav-item active">
		      <a class="nav-link" href="${contextPath}">Home</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">상품소개</a>
		    </li>
		    
		    <li class="dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">게시판</a>
		      <div class="dropdown-menu">
		      	<c:forEach items="${cateList}" var="c">
					  	<a class="dropdown-item" href="${contextPath}/board/list/${c.cid}">${c.cname}</a>
				</c:forEach>
		      </div>
		    </li>

		    <li class="nav-item rp">
		    	<div class="d-flex justify-content-between">
					<sec:authorize access="isAnonymous()"> <!-- 권한이 없는 경우(로그인을 하지 않은 경우) -->
						<a class="nav-link" href="${contextPath}/member/login">로그인</a><br>
						<a class="nav-link" href="${contextPath}/member/join">회원가입</a><br>
					</sec:authorize>
				</div>
				
				<div class="d-flex justify-content-between">
					<div class="d-flex justify-content-between mr-3">
						<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')">
							<a class="nav-link" href="${contextPath}/member/admin">관리자페이지</a><br>
							<a class="nav-link" href="${contextPath}/member/myPage">회원페이지</a><br>
						</sec:authorize>
					</div>
					
					<sec:authorize access="isAuthenticated()"> <!-- 권한이 있는 경우(로그인한 사용자) -->
						<form action="${contextPath}/member/logout" method="post">
							<div class="d-flex justify-content-between">
								<p class="lh"><b><sec:authentication property="principal.username" /></b>님 로그인 중</p>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<button class="btn btn-danger ml-3">로그아웃</button>
							</div>
						</form>
					</sec:authorize>
				</div>
				
		    </li>
		  </ul>
		</nav>
	</div>