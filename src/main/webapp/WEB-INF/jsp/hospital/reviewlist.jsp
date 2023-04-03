<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green - 리뷰 리스트</title>
</head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
			<div class="d-flex align-items-center">
			   <section class="d-flex">
                <nav>
                    <ul class="nav flex-column">
	                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#hospital">Hospital</a></li>
	             	 	<div id="hospital" class="panel-collapse collapse in" role="tabpanel">
		             	 	<ol class="menu">
				                <li class="nav-item"><a class="nav-link" href="/hospital/recommend/view">우리동네 추천병원</a></li>
				                <li class="nav-item"><a class="nav-link" href="#">가까운 병원찾기</a></li>
				                <li class="nav-item"><a class="nav-link" href="/hospital/register/view">병원 등록</a></li>
		              		  </ol>
              		 	</div>
	                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#review" aria-constrols="addEx1">Review</a></li>
	             	 	<div id="review" class="panel-collapse collapse in" role="tabpanel">
		             	 	<ol class="menu">
				                <li class="nav-item"><a class="nav-link" href="hospital/subject/select">진료과목 선택</a></li>
				                <li class="nav-item"><a class="nav-link" href="#">병원 리뷰 작성</a></li>
				                <li class="nav-item"><a class="nav-link" href="#">모두의 리뷰</a></li>
		              		  </ol>
              		 	</div>
	                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#health" aria-constrols="addEx1">Health</a></li>
	             	 	<div id="health" class="panel-collapse collapse in" role="tabpanel">
		             	 	<ol class="menu">
				                <li class="nav-item"><a class="nav-link" href="#">건강정보</a></li>
				                <li class="nav-item"><a class="nav-link" href="#">건강정보 포스팅하기</a></li>
		              		  </ol>
              		 	</div>
	                   <li class="nav-item"><a class="nav-link" role="button" data-toggle="collapse" data-parent="#accParent" href="#community" aria-constrols="addEx1">Community</a></li>
	             	 	<div id="community" class="panel-collapse collapse in" role="tabpanel">
		             	 	<ol class="menu">
				                <li class="nav-item"><a class="nav-link" href="#">인기글 목록</a></li>
				                <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
		              		  </ol>
              		 	</div>
              		  
                   	   </ul>
                	</nav>
                
               <div class="d-flex">
               		<div class="container">
               		<h2>리뷰 리스트</h2>
               		<table class="table text-center">
               			<thead>
							<tr>
	               				<th>진료과목</th>
	               				<th>병원명</th>
	               				<th>평점</th>
	               				<th>제목(한줄평)</th>
	               				<th>작성자</th>
	               				<th>작성일</th>
               				</tr>
               			</thead>
               			<tbody>
               			
               				<tr>
               					<td>안과</td>
               					<td>아이준안과의원</td>
               					<td>9.5</td>
               					<td>추천합니다.</td>
               					<td>초록숲</td>
               					<td>2023-04-03</td>               					
               				</tr>
               		</tbody>
               		</table>
               	</div>  
            </div>
		</div>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	
</body>
</html>