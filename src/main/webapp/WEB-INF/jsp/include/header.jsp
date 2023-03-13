<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="d-flex justify-content-between align-items-center">
		<h1 class="text-white pt-2 pl-2"> Green Review (Hospital & Health)</h1>
		
		<c:if test="${not empty userId }">
			<div class="mr-3"><b>${userName }</b>님 환영합니다!<button class="btn">내 프로필</button><a href="/user/signout">로그아웃</a></div>
		</c:if>
	</header>